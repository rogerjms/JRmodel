package com.turing.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import com.turing.CharUtil;
/**
 * 字符串截取标签
 * @author 刘凯
 *
 */
public class LimiteStrCountTag extends TagSupport{
	
	private static final long serialVersionUID = 1L;
	private String metaStr;
	private String content;
	
	@Override
	public int doStartTag() throws JspException {
		
		JspWriter out = this.pageContext.getOut();
		
		int shu = 26;
		try {
			int count = 0;
			for(int i=0;i<metaStr.length();i++){
				char c = metaStr.charAt(i);
				if (CharUtil.isChinese(c)) {
					
				} else {
					count++;
				}
			}
			
			if(count>14){
				if(shu<metaStr.length()){
					metaStr = metaStr.substring(0, shu)+"...";
				}
			}else{
				if(shu/2<metaStr.length()){
					metaStr = metaStr.substring(0, shu/2)+"...";
				}
			}
			
			
			if(content==null){
				content = "#";
			}
			out.println("<p style='text-align:left;'><a href='"+content+"'>"+metaStr+"</a></p>");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return super.doStartTag();
	}

	public String getMetaStr() {
		return metaStr;
	}

	public void setMetaStr(String metaStr) {
		this.metaStr = metaStr;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}


}
