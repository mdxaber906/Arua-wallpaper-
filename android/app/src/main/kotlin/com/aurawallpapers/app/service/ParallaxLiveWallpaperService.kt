package com.aurawallpapers.app.service

import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.Canvas
import android.graphics.Paint
import android.graphics.RectF
import android.os.Handler
import android.os.Looper
import android.service.wallpaper.WallpaperService
import android.view.SurfaceHolder
import com.aurawallpapers.app.helper.SensorHelper
import com.aurawallpapers.app.helper.WallpaperPreferencesHelper
import kotlin.math.max

class ParallaxLiveWallpaperService : WallpaperService() {

    override fun onCreateEngine(): Engine {
        return ParallaxEngine()
    }

    inner class ParallaxEngine : Engine(), SurfaceHolder.Callback {
        private val preferencesHelper = WallpaperPreferencesHelper(applicationContext)
        private val handler = Handler(Looper.getMainLooper())
        private val paint = Paint(Paint.ANTI_ALIAS_FLAG)

        private var bitmap: Bitmap? = null
        private var offsetX = 0f
        private var offsetY = 0f
        private var drawTask: Runnable? = null
        private var isSurfaceReady = false

        private val sensorHelper = SensorHelper(applicationContext) { x, y ->
            offsetX = x
            offsetY = y
            drawFrame()
        }

        override fun onCreate(surfaceHolder: SurfaceHolder) {
            super.onCreate(surfaceHolder)
            surfaceHolder.addCallback(this)
        }

        override fun surfaceCreated(holder: SurfaceHolder) {
            isSurfaceReady = true
            loadWallpaperImage()
            drawFrame()
        }

        override fun surfaceChanged(
            holder: SurfaceHolder,
            format: Int,
            width: Int,
            height: Int
        ) {
            if (isSurfaceReady) {
                drawFrame()
            }
        }

        override fun surfaceDestroyed(holder: SurfaceHolder) {
            isSurfaceReady = false
            sensorHelper.stop()
            handler.removeCallbacksAndMessages(null)
        }

        override fun onSurfaceDestroyed(holder: SurfaceHolder) {
            super.onSurfaceDestroyed(holder)
            isSurfaceReady = false
            sensorHelper.stop()
            handler.removeCallbacksAndMessages(null)
        }

        override fun onVisibilityChanged(visible: Boolean) {
            super.onVisibilityChanged(visible)
            if (visible) {
                sensorHelper.start()
                scheduleFrameUpdate()
            } else {
                sensorHelper.stop()
                handler.removeCallbacksAndMessages(null)
            }
        }

        override fun onDestroy() {
            sensorHelper.stop()
            handler.removeCallbacksAndMessages(null)
            surfaceHolder.removeCallback(this)
            bitmap?.recycle()
            bitmap = null
            super.onDestroy()
        }

        private fun loadWallpaperImage() {
            val sourceAsset = preferencesHelper.getSelectedWallpaperSource() ?: return
            try {
                assets.open("flutter_assets/$sourceAsset").use { inputStream ->
                    bitmap = BitmapFactory.decodeStream(inputStream)
                }
            } catch (exception: Exception) {
                exception.printStackTrace()
            }
        }

        private fun scheduleFrameUpdate() {
            handler.removeCallbacksAndMessages(null)

            val delay = if (preferencesHelper.isBatterySaverEnabled()) 1000L else 40L

            val task = object : Runnable {
                override fun run() {
                    drawFrame()
                    handler.postDelayed(this, delay)
                }
            }

            drawTask = task
            handler.post(task)
        }

        private fun drawFrame() {
            if (!isSurfaceReady) return

            val image = bitmap ?: return
            var canvas: Canvas? = null

            try {
                canvas = surfaceHolder.lockCanvas() ?: return

                canvas.drawColor(0xFF000000.toInt())

                val width = canvas.width.toFloat()
                val height = canvas.height.toFloat()

                val scale = max(width / image.width.toFloat(), height / image.height.toFloat())
                val drawWidth = image.width.toFloat() * scale
                val drawHeight = image.height.toFloat() * scale

                val horizontalOffset = (width - drawWidth) / 2f + (offsetX * 40f)
                val verticalOffset = (height - drawHeight) / 2f + (offsetY * 40f)

                val targetRect = RectF(
                    horizontalOffset,
                    verticalOffset,
                    horizontalOffset + drawWidth,
                    verticalOffset + drawHeight
                )

                canvas.drawBitmap(image, null, targetRect, paint)
            } catch (exception: Exception) {
                exception.printStackTrace()
            } finally {
                if (canvas != null) {
                    try {
                        surfaceHolder.unlockCanvasAndPost(canvas)
                    } catch (exception: Exception) {
                        exception.printStackTrace()
                    }
                }
            }
        }
    }
}
