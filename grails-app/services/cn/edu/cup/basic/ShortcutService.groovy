package cn.edu.cup.basic

import grails.gorm.services.Service

@Service(Shortcut)
interface ShortcutService {

    Shortcut get(Serializable id)

    List<Shortcut> list(Map args)

    Long count()

    void delete(Serializable id)

    Shortcut save(Shortcut shortcut)

}