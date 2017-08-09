package com.linestore.service.impl;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.linestore.dao.SiteConfigDao;
import com.linestore.service.SiteConfigService;
import com.linestore.vo.SiteConfig;
@Transactional
public class SiteConfigServiceImpl implements SiteConfigService {
	private SiteConfigDao siteConfigDao;
	
	
	
	public SiteConfigDao getSiteConfigDao() {
		return siteConfigDao;
	}

	public void setSiteConfigDao(SiteConfigDao siteConfigDao) {
		this.siteConfigDao = siteConfigDao;
	}

	@Override
	public List<SiteConfig> selectCusConfig(String configName) {
		// TODO Auto-generated method stub
		return this.siteConfigDao.selectByConfigName(configName);
	}

	@Override
	public void updateCusConfig(String hql) {
		// TODO Auto-generated method stub
		this.siteConfigDao.updateConfig(hql);

	}

	@Override
	public void selectAdvConfig(String configName) {
		// TODO Auto-generated method stub
		this.siteConfigDao.selectByConfigName(configName);

	}

}