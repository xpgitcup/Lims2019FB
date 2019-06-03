package cn.edu.cup.common

class GenericService {

    /*
    * 2016.12.17
    * 参数检测
    * */
    def paramsCheckA(pName, params) {
        def result = [:]
        if (!params.containsKey(pName)) {
            result.put(pName, "请补充！")
        }
        return result
    }

    /*
    * 2016.12.12
    * 参数检测
    * */
    def paramsCheck(pName, params) {
        if (!params.containsKey(pName)) {
            return "请补充${pName}参数"
        } else {
            return ""
        }
    }
}
