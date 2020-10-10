package com.jxd.dao;

        import com.jxd.model.MealInfo;
        import org.apache.ibatis.annotations.Param;

        import java.util.List;

public interface IMealInfoDao {
    List<MealInfo> getAllMealInfo(@Param("empno") int empno);
    List<MealInfo> getAllMealInfoByPage(@Param("empno") int empno,@Param("pageIndex") int pageIndex,@Param("pageSize") int pageSize);
    boolean updMealInfoState(@Param("onum") int onum,@Param("state") int state);
    boolean addMealInfo(MealInfo mealInfo);
    List<MealInfo> getAllMealInfoByEmp(@Param("anum") int anum);
    List<MealInfo> getAllMealInfoByEmpAndPage(@Param("anum") int anum,@Param("pageIndex") int pageIndex,@Param("pageSize") int pageSize);
}
