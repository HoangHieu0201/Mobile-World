package vn.devpro.TestAdmin.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import vn.devpro.TestAdmin.dto.FinalConstant;
import vn.devpro.TestAdmin.model.User;



@Service
public class UserService extends BaseService<User> implements FinalConstant{

	@Override
	public Class<User> clazz(){
		return User.class;
	}
	
	public List<User> findAllActive() {
		return super.executeNativeSql("SELECT * FROM tbl_user WHERE status = 1");
	}
	
	@Transactional
	public void deleteUserId(int id) {
		super.deleteById(id);
	}
	
	@Transactional
	public void inactiveUser(User user) {
		super.saveOrUpdate(user);
	}
	
	// Ham kiem tra (1) file co duoc upload ko?
		public boolean isUploadFile(MultipartFile file) {
			if (file == null || file.getOriginalFilename().isEmpty()) {
				return false; // ko upload
			}
			return true; // co upload
		}

//				---------------Save new user to database--------------------
		@Transactional
		public User saveAddUser(User user, MultipartFile avatarFile) throws IOException {

			// Luu avatar file
			if (isUploadFile(avatarFile)) { // co upload file avtaar
				String path = FOLDER_UPLOAD + "Product/Avatar/" + avatarFile.getOriginalFilename();
				File file = new File(path);
				avatarFile.transferTo(file);
				// Luu duong dan vao bang product
				user.setAvatar("Product/Avatar/" + avatarFile.getOriginalFilename());
			}
			return super.saveOrUpdate(user);
		}

//				------------------------------Save edit user------------------------------------
		@Transactional
		public User saveEditUser(User user, MultipartFile avatarFile) throws IOException {

			// Lay product trong db
			User dbUser = super.getById(user.getId());

			// Luu avatar file mowis neu nguoi dung co upload avatar
			if (isUploadFile(avatarFile)) { // co upload file avtaar

				// Xoa avatar cu
				String path = FOLDER_UPLOAD + dbUser.getAvatar();
				File file = new File(path);
				file.delete();

				// Luu file avata moi vao thu muc Product/Avtar
				path = FOLDER_UPLOAD + "User/Avatar/" + avatarFile.getOriginalFilename();
				file = new File(path);
				avatarFile.transferTo(file);
				// Luu duong dan vao bang product
				user.setAvatar("User/Avatar/" + avatarFile.getOriginalFilename());
			} else { // Nguoi dung ko upload avatar file
						// Giu nguyen avatar cu
				user.setAvatar(dbUser.getAvatar());
			}

			return super.saveOrUpdate(user);
		}

}
