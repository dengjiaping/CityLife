package com.wb.citylife.config;

/**
 * 此类定义Intent跳转携带的数据名称
 * @author liangbx
 *
 */
public interface IntentExtraConfig {
	
	/***************************** 主页  **********************************************/
	public static final String WELCOME_IMG = "img";
	
	/***************************** 详情页  **********************************************/
	public static final String DETAIL_ID = "id";
	public static final String DETAIL_TYPE = "type";
	public static final String DETAIL_NAME = "name";
	
	/***************************** 栏目排序  **********************************************/
	public static final String OC_CHANNEL = "channel";
	public static final String CHANNEL_ID = "channel_id";
	public static final String CHANNEL_NAME = "channel_name";
	
	/***************************** 二手市场  **********************************************/
	public static final String OLD_TYPE = "type";
	
	/***************************** 随手拍  **********************************************/
	public static final String SHOOT_TYPE = "type";
	
	/***************************** 房地产  **********************************************/
	public static final String ESTATE_TYPE = "type";
	public static final String ESTATE_IMAGE_DATA = "image";	
	public static final String ESTATE_DIS_TAB = "dis_tab";
	public static final String ESTATE_IMG_POS = "img_pos";	
	
	/***************************** 类型列表  **********************************************/
	public static final String COMMENT_ID = "id";
	public static final String COMMENT_TYPE = "type";
	
	/***************************** 视频  **********************************************/
	public static final String VIDEO_PATH = "video_path";
	
	/***************************** 欢迎页  **********************************************/
	public static final String DIS_WELCOME = "dis_welcome";
	
	/***************************** 搜索  **********************************************/
	public static final String SEARCH_TYPE = "search_type";
	
	public static final String USER_PHONE = "user_phone";
	
	/***************************** 输入用途 ***************************************/
	public static final String INPUT_PHONE_TYPE = "input_type";
	public static final int INPUT_TYPE_REGISTER = 0;
	public static final int INTPU_TYPE_RESET = 1;
}
