package cn.edu.cup.basic

import grails.gorm.services.Service

@Service(StudentClass)
interface StudentClassService {

    StudentClass get(Serializable id)

    List<StudentClass> list(Map args)

    Long count()

    void delete(Serializable id)

    StudentClass save(StudentClass studentClass)

}