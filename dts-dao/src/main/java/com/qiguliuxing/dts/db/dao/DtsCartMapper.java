package com.qiguliuxing.dts.db.dao;

import com.qiguliuxing.dts.db.domain.DtsCart;
import com.qiguliuxing.dts.db.domain.DtsCartExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DtsCartMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dts_cart
     *
     * @mbg.generated
     */
    long countByExample(DtsCartExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dts_cart
     *
     * @mbg.generated
     */
    int deleteByExample(DtsCartExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dts_cart
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dts_cart
     *
     * @mbg.generated
     */
    int insert(DtsCart record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dts_cart
     *
     * @mbg.generated
     */
    int insertSelective(DtsCart record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dts_cart
     *
     * @mbg.generated
     * @project https://github.com/itfsw/mybatis-generator-plugin
     */
    DtsCart selectOneByExample(DtsCartExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dts_cart
     *
     * @mbg.generated
     * @project https://github.com/itfsw/mybatis-generator-plugin
     */
    DtsCart selectOneByExampleSelective(@Param("example") DtsCartExample example, @Param("selective") DtsCart.Column ... selective);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dts_cart
     *
     * @mbg.generated
     * @project https://github.com/itfsw/mybatis-generator-plugin
     */
    List<DtsCart> selectByExampleSelective(@Param("example") DtsCartExample example, @Param("selective") DtsCart.Column ... selective);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dts_cart
     *
     * @mbg.generated
     */
    List<DtsCart> selectByExample(DtsCartExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dts_cart
     *
     * @mbg.generated
     * @project https://github.com/itfsw/mybatis-generator-plugin
     */
    DtsCart selectByPrimaryKeySelective(@Param("id") Integer id, @Param("selective") DtsCart.Column ... selective);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dts_cart
     *
     * @mbg.generated
     */
    DtsCart selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dts_cart
     *
     * @mbg.generated
     * @project https://github.com/itfsw/mybatis-generator-plugin
     */
    DtsCart selectByPrimaryKeyWithLogicalDelete(@Param("id") Integer id, @Param("andLogicalDeleted") boolean andLogicalDeleted);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dts_cart
     *
     * @mbg.generated
     */
    int updateByExampleSelective(@Param("record") DtsCart record, @Param("example") DtsCartExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dts_cart
     *
     * @mbg.generated
     */
    int updateByExample(@Param("record") DtsCart record, @Param("example") DtsCartExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dts_cart
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(DtsCart record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dts_cart
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(DtsCart record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dts_cart
     *
     * @mbg.generated
     * @project https://github.com/itfsw/mybatis-generator-plugin
     */
    int logicalDeleteByExample(@Param("example") DtsCartExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dts_cart
     *
     * @mbg.generated
     * @project https://github.com/itfsw/mybatis-generator-plugin
     */
    int logicalDeleteByPrimaryKey(Integer id);
}