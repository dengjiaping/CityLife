﻿package ${PackageName};

import java.util.HashMap;
<#if isList == "false">
<#else>
import java.util.List;
</#if>
import java.util.Map;

import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ListView;

import com.android.volley.Request.Method;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.VolleyError;
import ${PackageName}.activity.base.BaseActivity;
import ${PackageName}.config.NetConfig;
import com.common.net.volley.VolleyErrorHelper;
import com.common.widget.ToastHelper;
import com.handmark.pulltorefresh.library.PullToRefreshBase;
import com.handmark.pulltorefresh.library.PullToRefreshBase.OnLastItemVisibleListener;
import com.handmark.pulltorefresh.library.PullToRefreshListView;
import com.handmark.pulltorefresh.library.PullToRefreshBase.OnRefreshListener2;
import ${PackageName}.bean.${DataName};
import ${PackageName}.task.${TaskName};

<#if isList == "false">
public class ${ClassName} extends BaseActivity implements Listener<${DataName}>, ErrorListener{
<#else>
public class ${ClassName} extends BaseActivity implements Listener<List<${DataName}>>, ErrorListener{
</#if>	
	
	private PullToRefreshListView mPullListView;
		
	private ${TaskName} m${TaskName};
	<#if isList == "false">
	private ${DataName} m${DataName};
	<#else>
	private List<${DataName}> m${DataName}List;
	</#if>
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.${LayoutName});
		
		getIntentData();
		initView();				
	}
			
	@Override
	public void getIntentData() {
		
	}
	
	@Override
	public void initView() {
		mPullListView = (PullToRefreshListView) findViewById(R.id.pull_refresh_list);		
		mPullListView.setOnRefreshListener(new OnRefreshListener2<ListView>() {

			@Override
			public void onPullDownToRefresh(PullToRefreshBase<ListView> refreshView) {
				//处理下拉刷新
			}

			@Override
			public void onPullUpToRefresh(PullToRefreshBase<ListView> refreshView) {
				//处理上拉加载
			}
		});
		
		mPullListView.setOnLastItemVisibleListener(new OnLastItemVisibleListener() {

			@Override
			public void onLastItemVisible() {
				//滑动到底部的处理
			}
		});
		
		//设置刷新时的滑动开关		
		mPullListView.setScrollingWhileRefreshingEnabled(true);
		
		//设置自动刷新
		mPullListView.setRefreshing(false);
	}
	
	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		//此处设置菜单		
		setDisplayHomeAsUpEnabled(true);
		setDisplayShowHomeEnabled(false);
		
		//request${DataName}(Method.${ReqType}, "请求方法", get${TaskName}Params(), this, this);
		setIndeterminateBarVisibility(true);		
		return super.onCreateOptionsMenu(menu);
	}
	
	/**
	 * 菜单点击处理
	 */
	@Override
	public boolean onOptionsItemSelected(MenuItem item) {			
		return super.onOptionsItemSelected(item);
	}
		
	/**
	 * 获取请求参数
	 * @return
	 */
	private Map<String, String> get${TaskName}Params() {
		Map<String, String> params = new HashMap<String, String>();
				
		return params;
	}
	
	/**
	 * 执行任务请求
	 * @param method
	 * @param url
	 * @param params
	 * @param listenre
	 * @param errorListener
	 */	
	<#if isList == "false">
	private void request${DataName}(int method, String methodUrl, Map<String, String> params,	 
			Listener<${DataName}> listenre, ErrorListener errorListener) {			
	<#else>
			private void executeRequest(int method, String methodUrl, Map<String, String> params,		
			Listener<List<${DataName}>> listenre, ErrorListener errorListener) {
	</#if>
		if(m${TaskName} != null) {
			m${TaskName}.cancel();
		}	
		String url = NetConfig.getServerBaseUrl() + NetConfig.EXTEND_URL + methodUrl;
		m${TaskName} = new ${TaskName}(method, url, params, listenre, errorListener);
		startRequest(m${TaskName});		
	}
	
	/**
	 * 网络请求错误处理
	 *
	 */
	@Override
	public void onErrorResponse(VolleyError error) {		
		setIndeterminateBarVisibility(false);
		ToastHelper.showToastInBottom(getApplicationContext(), VolleyErrorHelper.getErrorMessage(error));
	}
	
	/**
	 * 请求完成，处理UI更新
	 */
	@Override
	<#if isList == "false">
	public void onResponse(${DataName} response) {
		m${DataName} = response;
	<#else>
	public void onResponse(List<${DataName}> response) {
		m${DataName}List = response;
	</#if>	
		setIndeterminateBarVisibility(false);
	}
}
