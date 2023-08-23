class RemoteConstants {
  RemoteConstants._();
  static const baseUrl = 'https://maktabkhoneh-api.sasansafari.com/api/v1';
  static const postAdd = '$baseUrl/post/add';
  static const getSinglePost = '$baseUrl/post/getpost';
  static const getPostList = '$baseUrl/post/getposts';
  static const deletePost = '$baseUrl/post/delete';
  static const editPost = '$baseUrl/post/edit';
  static const likePost = '$baseUrl/post/like';
  static const deleteFile = '$baseUrl/post/deletefile';
  static const uploadFile = '$baseUrl/post/fileupload';
  static const userActivate = '$baseUrl/auth/check_active';
  static const register = '$baseUrl/auth/register';
  static const resendActivation = '$baseUrl/auth/resend_token';
  static const verify = '$baseUrl/auth/verify';
  static const login = '$baseUrl/auth/login';
  static const getUser = '$baseUrl/user/getuser';
  static const followUser = '$baseUrl/user/follow';
  static const updateUser = '$baseUrl/user/update';
  static const deleteUser = '$baseUrl/user/delete';
  static const getStoryList = '$baseUrl/story/getstories';
}

class RemoteKey {
  RemoteKey._();

  static const userName = 'username';
  static const email = 'email';
  static const password = 'password';
  static const fullName = 'full_name';
  static const phone = 'phone';
  static const userAvatar = 'user_avatar';
  static const userId = 'user_id';
  static const verifyToken = 'verify_token';
  static const activeToken = 'active_token';
  static const deleteId = 'delete_id';
  static const followerId = 'follower_id';
  static const storyId = 'story_id';
  static const random = 'random';
  static const file = 'file';
  static const fileId = 'file_id';
  static const content = 'content';
  static const postId = 'post_id';
  static const authToken = 'auth_token';
}
