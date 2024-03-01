package vn.devpro.TestAdmin.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import vn.devpro.TestAdmin.model.Role;



@Service
public class RoleService extends BaseService<Role>{

	@Override
	public Class<Role> clazz(){
		return Role.class;
	}	
	
	public List<Role> findAllActive() {
		return super.executeNativeSql("SELECT * FROM tbl_role WHERE status = 1");
	}
	
	@Transactional
	public void deleteRoleId(int id) {
		super.deleteById(id);
	}
	
	@Transactional
	public void inactiveRole(Role role) {
		super.saveOrUpdate(role);
	}
	
	public Role getRoleByName(String roleName) {
//	    // Sử dụng PreparedStatement để tránh SQL injection
//	    String sql = "SELECT * FROM tbl_role WHERE name=?";
//	    
//	    // Thực hiện truy vấn và lấy kết quả
//	    List<Role> roles = super.executeNativeSql(sql, roleName);
//
//	    // Kiểm tra xem có role nào được tìm thấy không
//	    if (!roles.isEmpty()) {
//	        // Trả về role đầu tiên nếu có
//	        return roles.get(0);
//	    } else {
//	        // Trả về null nếu không tìm thấy role
//	        return null;
//	    }
		String sql = "SELECT * FROM tbl_role WHERE name= '" + roleName + "'";
		List<Role> roles = super.executeNativeSql(sql);
		
		if(roles.size() > 0) {
			return roles.get(0);
		}
		else {
			return new Role();
		}
	}
}
