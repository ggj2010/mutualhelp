package com.ggj.mutualhelp.common.crud;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.ggj.mutualhelp.common.persistence.BaseEntity;
import com.github.pagehelper.PageInfo;

/**
 * @ClassName:CrudService.java
 * @Description:  增删改基础service  
 * @author gaoguangjin
 * @Date 2015-9-24 下午5:24:45
 */

@Transactional(readOnly = true)
public abstract class CrudService<D extends CrudDao<T>, T extends BaseEntity> {
	
	/**
	 * 持久层对象
	 */
	@Autowired
	protected D dao;
	
	/**
	 * 获取单条数据
	 * @param entity
	 * @return
	 */
	public T get(T entity) {
		return dao.get(entity);
	}
	
	public T get(String id) {
		return dao.get(id);
	}
	
	/**
	 * 查询列表数据
	 * @param entity
	 * @return
	 */
	public List<T> findList(T entity) {
		return dao.findList(entity);
	}
	
	/**
	 * 查询分页数据
	 * @param page 分页对象
	 * @param entity
	 * @return
	 */
	public PageInfo<T> findPage(T entity) {
		return new PageInfo<T>(dao.findList(entity));
	}
	
	/**
	 * 保存数据（插入或更新）
	 * @param entity
	 */
	@Transactional(readOnly = false)
	public void save(T entity) {
		if (StringUtils.isEmpty(entity.getId())) {
			entity.preInsert();
			dao.insert(entity);
		} else {
			entity.preUpdate();
			dao.update(entity);
		}
	}
	
	/**
	 * 删除数据
	 * @param entity
	 */
	@Transactional(readOnly = false)
	public void delete(T entity) {
		dao.delete(entity);
	}
	
}
