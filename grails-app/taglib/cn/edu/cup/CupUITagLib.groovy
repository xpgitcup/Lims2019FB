package cn.edu.cup

class CupUITagLib {
    static defaultEncodeAs = [taglib: 'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    def limitString = { attr, body ->
        def outString
        def tmp = attr.source.toString()//"${attr.source}"
        def len = Integer.parseInt(attr.length)
        //println("-->${tmp}  ${tmp.length()}")
        if (tmp.length() > len) {
            outString = tmp.substring(0, len - 3) + "..."
        } else {
            outString = tmp
        }
        out << outString
    }
}
