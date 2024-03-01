package vn.devpro.TestAdmin.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import vn.devpro.TestAdmin.dto.SearchModel;
import vn.devpro.TestAdmin.model.Contact;

@Service
public class ContactService extends BaseService<Contact>{

		@Override
		public Class<Contact> clazz() {
			return Contact.class;
		}
		
		public List<Contact> findAllActive() {
			return super.executeNativeSql("SELECT * FROM tbl_Contact WHERE status = 1");
		}
		
		@Transactional
		public void deleteContactId(int id) {
			super.deleteById(id);
		}
		
		@Transactional
		public void inactiveContact(Contact contact) {
			super.saveOrUpdate(contact);
		}
	
		//Them moi hoac sua mot ban ghi
		@Transactional
		public Contact saveOrUpdateContact(Contact contact) {
			if (contact.getId() == null || contact.getId() <= 0) { //Add new entity
				entityManager.persist(contact);
				return contact;
			}
			else { //update entity
				return entityManager.merge(contact);
			}
		}
		
		// ------------------------------------Search sale-order---------------------------------------------

		public List<Contact> searchContact(SearchModel searchModel) {
			// Tao cau lenhj sql
			String sql = "SELECT * FROM tbl_contact p WHERE 1 = 1";

			// Tim kiem tvoi tieu chi status
			if (searchModel.getStatus() != 2) { // co chon active/inavtive
				sql += " AND p.status=" + searchModel.getStatus();
			}

			// Tim kiem voi tieu chi keyword
			if (!StringUtils.isEmpty(searchModel.getKeyword())) {

				String keyword = searchModel.getKeyword().toLowerCase();

				sql += " AND (LOWER(p.name) like '%" + keyword
						+ "%'" + " OR LOWER(p.mobile) like '%" + keyword + "%')";
			}

			// tim kiem voi ngay thang
			if (!StringUtils.isEmpty(searchModel.getBeginDate())
					&& !StringUtils.isEmpty(searchModel.getEndDate())) {
				String beginDate = searchModel.getBeginDate();
				String endDate = searchModel.getEndDate();

				sql += " AND p.create_date BETWEEN '" + beginDate + "' AND '" + endDate + "'";
			}

			return super.executeNativeSql(sql);
		}

}
