package vn.devpro.TestAdmin.dto;

public class SearchModel {

	private int status;
	private int categoryId;
	private String keyword;
	
	private String beginDate;
	private String endDate;
	
	private String beginYear;
	private String endYear;
	
	private String beginPrice;
	private String endPrice;
	
	private int sizeOfPage; //so ban ghi hien thi tren mot trang
	private int currentPage; // Trang hien tai
	private int totalItems; //Tong so ban ghi tim kiem dc
	private int totalPages; //tong so trang
	
	private String[] priceRanges;
	
	public SearchModel() {
		super();
	}

	public SearchModel(int status, int categoryId, String keyword, String beginDate, String endDate, String beginYear,
			String endYear, String beginPrice, String endPrice, int sizeOfPage, int currentPage, int totalItems,
			int totalPages, String[] priceRanges) {
		super();
		this.status = status;
		this.categoryId = categoryId;
		this.keyword = keyword;
		this.beginDate = beginDate;
		this.endDate = endDate;
		this.beginYear = beginYear;
		this.endYear = endYear;
		this.beginPrice = beginPrice;
		this.endPrice = endPrice;
		this.sizeOfPage = sizeOfPage;
		this.currentPage = currentPage;
		this.totalItems = totalItems;
		this.totalPages = totalPages;
		this.priceRanges = priceRanges;
	}


	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(String beginDate) {
		this.beginDate = beginDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public int getSizeOfPage() {
		return sizeOfPage;
	}

	public void setSizeOfPage(int sizeOfPage) {
		this.sizeOfPage = sizeOfPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalItems() {
		return totalItems;
	}

	public void setTotalItems(int totalItems) {
		this.totalItems = totalItems;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}


	public String getBeginYear() {
		return beginYear;
	}


	public void setBeginYear(String beginYear) {
		this.beginYear = beginYear;
	}


	public String getEndYear() {
		return endYear;
	}


	public void setEndYear(String endYear) {
		this.endYear = endYear;
	}


	public String getBeginPrice() {
		return beginPrice;
	}


	public void setBeginPrice(String beginPrice) {
		this.beginPrice = beginPrice;
	}


	public String getEndPrice() {
		return endPrice;
	}


	public void setEndPrice(String endPrice) {
		this.endPrice = endPrice;
	}

	public String[] getPriceRanges() {
		return priceRanges;
	}

	public void setPriceRanges(String[] priceRanges) {
		this.priceRanges = priceRanges;
	}

	
}
