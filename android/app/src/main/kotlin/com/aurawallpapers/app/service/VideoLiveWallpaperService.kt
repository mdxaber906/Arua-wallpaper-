package com.aurawallpapers.app.service

import android.media.MediaPlayer
import android.service.wallpaper.WallpaperService
import android.view.SurfaceHolder

class VideoLiveWallpaperService : WallpaperService() {

    override fun onCreateEngine(): Engine {
        return VideoEngine()
    }

    inner class VideoEngine : Engine(), SurfaceHolder.Callback {

        private var mediaPlayer: MediaPlayer? = null
        private var isSurfaceReady = false

        init {
            surfaceHolder.addCallback(this)
        }

        override fun surfaceCreated(holder: SurfaceHolder) {
            isSurfaceReady = true
            startVideo(holder)
        }

        override fun surfaceChanged(
            holder: SurfaceHolder,
            format: Int,
            width: Int,
            height: Int
        ) {
            if (isSurfaceReady) {
                startVideo(holder)
            }
        }

        override fun surfaceDestroyed(holder: SurfaceHolder) {
            isSurfaceReady = false
            releasePlayer()
        }

        override fun onVisibilityChanged(visible: Boolean) {
            super.onVisibilityChanged(visible)

            val player = mediaPlayer
            if (visible) {
                if (player != null && !player.isPlaying) {
                    player.start()
                }
            } else {
                if (player != null && player.isPlaying) {
                    player.pause()
                }
            }
        }

        override fun onDestroy() {
            releasePlayer()
            surfaceHolder.removeCallback(this)
            super.onDestroy()
        }

        private fun startVideo(holder: SurfaceHolder) {
            try {
                if (mediaPlayer != null) return

                // Placeholder safe player.
                // Later you can load a real video file path from SharedPreferences.
                mediaPlayer = MediaPlayer().apply {
                    setSurface(holder.surface)
                    isLooping = true
                    setOnPreparedListener { player ->
                        player.start()
                    }
                }
            } catch (e: Exception) {
                e.printStackTrace()
                releasePlayer()
            }
        }

        private fun releasePlayer() {
            try {
                mediaPlayer?.stop()
            } catch (_: Exception) {
            }

            try {
                mediaPlayer?.release()
            } catch (_: Exception) {
            }

            mediaPlayer = null
        }
    }
}
