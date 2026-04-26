import '../../core/enums/wallpaper_category.dart';
import '../../core/enums/wallpaper_type.dart';
import '../models/wallpaper_model.dart';

class LocalWallpaperSource {
  const LocalWallpaperSource();

  List<WallpaperModel> loadWallpapers() {
    return const [

      // ========== FOOTBALL ==========
      WallpaperModel(
        id: 'football_video_1',
        title: 'Night Stadium Pulse',
        category: WallpaperCategory.football,
        type: WallpaperType.video,
        thumbnailAsset: 'assets/wallpapers/football/thumbs/football1.jpg',
        sourceAsset: 'assets/wallpapers/football/sources/football1.mp4',
        isPremium: true,
        tags: ['stadium', 'motion', 'sport'],
      ),
      WallpaperModel(
        id: 'football_image_1',
        title: 'Endline Ambition',
        category: WallpaperCategory.football,
        type: WallpaperType.image,
        thumbnailAsset: 'assets/wallpapers/football/thumbs/football2.jpg',
        sourceAsset: 'assets/wallpapers/football/sources/football2.jpg',
        tags: ['football', 'dark', 'arena'],
      ),
      WallpaperModel(
        id: 'football_image_2',
        title: 'Golden Boot',
        category: WallpaperCategory.football,
        type: WallpaperType.image,
        thumbnailAsset: 'assets/wallpapers/football/thumbs/football3.jpg',
        sourceAsset: 'assets/wallpapers/football/sources/football3.jpg',
        isPremium: false,
        tags: ['football', 'golden', 'sport'],
      ),
      WallpaperModel(
        id: 'football_video_2',
        title: 'Match Day Energy',
        category: WallpaperCategory.football,
        type: WallpaperType.video,
        thumbnailAsset: 'assets/wallpapers/football/thumbs/football4.jpg',
        sourceAsset: 'assets/wallpapers/football/sources/football4.mp4',
        isPremium: true,
        tags: ['football', 'energy', 'crowd'],
      ),

      // ========== ANIME ==========
      WallpaperModel(
        id: 'anime_motion_1',
        title: 'Celestial Drift',
        category: WallpaperCategory.anime,
        type: WallpaperType.motion,
        thumbnailAsset: 'assets/wallpapers/anime/thumbs/anime1.jpg',
        sourceAsset: 'assets/wallpapers/anime/sources/anime1.jpg',
        isPremium: true,
        tags: ['anime', 'motion', 'fantasy'],
      ),
      WallpaperModel(
        id: 'anime_video_1',
        title: 'Moonlight Hero',
        category: WallpaperCategory.anime,
        type: WallpaperType.video,
        thumbnailAsset: 'assets/wallpapers/anime/thumbs/anime2.jpg',
        sourceAsset: 'assets/wallpapers/anime/sources/anime2.mp4',
        tags: ['hero', 'video', 'dynamic'],
      ),
      WallpaperModel(
        id: 'anime_image_1',
        title: 'Sakura Storm',
        category: WallpaperCategory.anime,
        type: WallpaperType.image,
        thumbnailAsset: 'assets/wallpapers/anime/thumbs/anime3.jpg',
        sourceAsset: 'assets/wallpapers/anime/sources/anime3.jpg',
        isPremium: false,
        tags: ['anime', 'sakura', 'beautiful'],
      ),
      WallpaperModel(
        id: 'anime_image_2',
        title: 'Shadow Ninja',
        category: WallpaperCategory.anime,
        type: WallpaperType.image,
        thumbnailAsset: 'assets/wallpapers/anime/thumbs/anime4.jpg',
        sourceAsset: 'assets/wallpapers/anime/sources/anime4.jpg',
        isPremium: true,
        tags: ['anime', 'ninja', 'dark'],
      ),

      // ========== GAMING ==========
      WallpaperModel(
        id: 'gaming_image_1',
        title: 'Neon Arena',
        category: WallpaperCategory.gaming,
        type: WallpaperType.image,
        thumbnailAsset: 'assets/wallpapers/gaming/thumbs/gaming1.jpg',
        sourceAsset: 'assets/wallpapers/gaming/sources/gaming1.jpg',
        tags: ['gaming', 'neon', 'cyber'],
      ),
      WallpaperModel(
        id: 'gaming_motion_1',
        title: 'Velocity Shift',
        category: WallpaperCategory.gaming,
        type: WallpaperType.motion,
        thumbnailAsset: 'assets/wallpapers/gaming/thumbs/gaming2.jpg',
        sourceAsset: 'assets/wallpapers/gaming/sources/gaming2.jpg',
        tags: ['speed', 'motion', 'power'],
      ),
      WallpaperModel(
        id: 'gaming_image_2',
        title: 'Battle Zone',
        category: WallpaperCategory.gaming,
        type: WallpaperType.image,
        thumbnailAsset: 'assets/wallpapers/gaming/thumbs/gaming3.jpg',
        sourceAsset: 'assets/wallpapers/gaming/sources/gaming3.jpg',
        isPremium: false,
        tags: ['gaming', 'battle', 'war'],
      ),
      WallpaperModel(
        id: 'gaming_video_1',
        title: 'Cyber Storm',
        category: WallpaperCategory.gaming,
        type: WallpaperType.video,
        thumbnailAsset: 'assets/wallpapers/gaming/thumbs/gaming4.jpg',
        sourceAsset: 'assets/wallpapers/gaming/sources/gaming4.mp4',
        isPremium: true,
        tags: ['gaming', 'cyber', 'storm'],
      ),

      // ========== NATURE ==========
      WallpaperModel(
        id: 'nature_image_1',
        title: 'Aurora Forest',
        category: WallpaperCategory.nature,
        type: WallpaperType.image,
        thumbnailAsset: 'assets/wallpapers/nature/thumbs/nature1.jpg',
        sourceAsset: 'assets/wallpapers/nature/sources/nature1.jpg',
        tags: ['nature', 'forest', 'calm'],
      ),
      WallpaperModel(
        id: 'nature_image_2',
        title: 'Ocean Breeze',
        category: WallpaperCategory.nature,
        type: WallpaperType.image,
        thumbnailAsset: 'assets/wallpapers/nature/thumbs/nature2.jpg',
        sourceAsset: 'assets/wallpapers/nature/sources/nature2.jpg',
        isPremium: false,
        tags: ['nature', 'ocean', 'blue'],
      ),
      WallpaperModel(
        id: 'nature_video_1',
        title: 'Sunset Valley',
        category: WallpaperCategory.nature,
        type: WallpaperType.video,
        thumbnailAsset: 'assets/wallpapers/nature/thumbs/nature3.jpg',
        sourceAsset: 'assets/wallpapers/nature/sources/nature3.mp4',
        isPremium: true,
        tags: ['nature', 'sunset', 'valley'],
      ),

      // ========== TRENDING ==========
      WallpaperModel(
        id: 'trending_video_1',
        title: 'Prism Glide',
        category: WallpaperCategory.trending,
        type: WallpaperType.video,
        thumbnailAsset: 'assets/wallpapers/gaming/thumbs/gaming1.jpg',
        sourceAsset: 'assets/wallpapers/gaming/sources/gaming1.mp4',
        isPremium: true,
        tags: ['trending', 'video', 'premium'],
      ),
      WallpaperModel(
        id: 'trending_motion_1',
        title: 'Kinetic Wave',
        category: WallpaperCategory.trending,
        type: WallpaperType.motion,
        thumbnailAsset: 'assets/wallpapers/anime/thumbs/anime1.jpg',
        sourceAsset: 'assets/wallpapers/anime/sources/anime1.jpg',
        tags: ['trending', 'motion', 'flow'],
      ),
      WallpaperModel(
        id: 'trending_image_1',
        title: 'Viral Vibes',
        category: WallpaperCategory.trending,
        type: WallpaperType.image,
        thumbnailAsset: 'assets/wallpapers/gaming/thumbs/gaming2.jpg',
        sourceAsset: 'assets/wallpapers/gaming/sources/gaming2.jpg',
        isPremium: false,
        tags: ['trending', 'viral', 'hot'],
      ),
    ];
  }
}
