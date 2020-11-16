package com.ruo.service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.ruo.entity.Position;

public interface PositionService extends IService<Position>{

	/**
	 * 根据PositionNumber查询信息
	 * @param positionNumber
	 * @return
	 */
	Position selectByNumber(Integer positionNumber);
	
	/**
	 * 分页查询所有职称（倒序）
	 * @param pageNo
	 * @return
	 */
	Page<Position> selectListByPage(int pageNo);
}
