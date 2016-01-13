package com.turing.yuce;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.tribes.util.Arrays;

public class YuCeServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		BufferedReader br = null;
		Process process = null;

		//一般参数
		int 身高 = preParamInt(request.getParameter("shenGao"));//shenGao@
        int 体重 = preParamInt(request.getParameter("tiZhong"));//tiZhong@
        int 腰围 = preParamInt(request.getParameter("yaoWei"));//yaoWei@
        int 性别 = preParamInt(request.getParameter("xingBie"));//xingBie@
        //通过出生日期算出年龄chuShengRiQi
        int 年龄 = preParamInt(request.getParameter("nianLing"));//nianLing@
        int 民族 = preParamInt(request.getParameter("mingZu"));//mingZu@
        int 您在北京居住时间是否超过15年 = preParamInt(request.getParameter("juZhuTime"));//juZhuTime@
        int 婚姻状况 = preParamInt(request.getParameter("hunYin"));//hunYin@
        int 职业 = preParamInt(request.getParameter("zhiYe"));//zhiYe@
        int 文化程度 = preParamInt(request.getParameter("wenHua"));//wenHua@
        int 医药费报销方式 = preParamInt(request.getParameter("baoXiao"));//baoXiao@
        int 现在吸烟情况 = preParamInt(request.getParameter("xiyanqingkuang"));//xiyanqingkuang@
        int 现在平均每天吸烟量 = preParamInt(request.getParameter("xiYanLiang"));//xiYanLiang@
        int 饮酒情况 = preParamInt(request.getParameter("yinjiuqingkuang"));//yinjiuqingkuang@
        int 白酒 = preParamInt(request.getParameter("baiJiu"));//baiJiu@
        int 啤酒 = preParamInt(request.getParameter("piJiu"));//piJiu@
        int 红酒 = preParamInt(request.getParameter("hongJiu"));//hongJiu@
        int 饮酒量 = preParamInt(request.getParameter("yinJiuLiang"));//yinJiuLiang@
        int 平均饮酒频率 =preParamInt(request.getParameter("yinJiuPinlv"));//yinJiuPinlv@
        int 高血压家族史 = preParamInt(request.getParameter("gaoxyHistory"));//gaoxyHistory@
        int 糖尿病家族史 = preParamInt(request.getParameter("tangnbHistory"));//tangnbHistory@
        int 冠心病家族史 = preParamInt(request.getParameter("guanxinHistory"));//guanxinHistory@
        int 急性心肌梗死家族史 = preParamInt(request.getParameter("xinJiHistory"));//xinJiHistory@
        int 脑卒中家族史 = preParamInt(request.getParameter("naoCuHisroty"));//naoCuHisroty@
        int 高血压病史 = preParamInt(request.getParameter("youwugaoxueya"));//youwugaoxueya@
        //gaoxyYue!="" gaoxyTime=0
        String gaoxyTimeYue = request.getParameter("gaoxyTimeYue");
        int 患高血压年限 = "".equals(gaoxyTimeYue)?0:preParamInt(request.getParameter("gaoxyTime"));//gaoxyTime@
        //判断多选个数
        String[] gaoxyBingFas = request.getParameterValues("gaoxyBingFa");
        int 有几种高血压并发症 = gaoxyBingFas==null?0:gaoxyBingFas.length;//gaoxyBingFa@
        int 最近两周服药情况 = preParamInt(request.getParameter("fuYaoQingKuang"));//fuYaoQingKuang@
        int 血脂异常情况 = preParamInt(request.getParameter("xueZhiQingKuang"));//xueZhiQingKuang@
        int 脂肪肝情况 = preParamInt(request.getParameter("zhiFangGanQingKuang"));//zhiFangGanQingKuang@
        int 患心肌梗死情况 = preParamInt(request.getParameter("youwuxinjigengse"));//youwuxinjigengse@
        int 患脑卒中情况 = preParamInt(request.getParameter("youwunaocuzhong"));//youwunaocuzhong@
        int 是否经常体育锻炼 = preParamInt(request.getParameter("tiyuduanlian"));//tiyuduanlian@
        int 每次运动持续时间 = preParamInt(request.getParameter("yunDongShiJian"));//yunDongShiJian@
        int 每周20分钟以上运动次数 = preParamInt(request.getParameter("yunDongCiShu"));//yunDongCiShu@
        int 臀围 = preParamInt(request.getParameter("tunWei"));//tunWei@
        int 心率 = preParamInt(request.getParameter("xinLv"));//xinLv@
        double 心电图Sv1 = preParamDouble(request.getParameter("xinDianTuSv1"));//xinDianTuSv1@
        int 心电图Rv5 = preParamInt(request.getParameter("xinDianTuRv5"));//xinDianTuRv5@
        
        //化验参数
        int 谷丙转氨酶 = preParamInt(request.getParameter("gunBingZhuanAnMei"));//gunBingZhuanAnMei@
        double 尿素 = preParamDouble(request.getParameter("niaoSu"));//niaoSu@
        double 血糖 = preParamDouble(request.getParameter("xueTang"));//xueTang@
        double 甘油三酯 = preParamDouble(request.getParameter("ganYouSanZhi"));//ganYouSanZhi@
        double 高密度脂蛋白胆固醇 = preParamDouble(request.getParameter("gaoMiDuZhiDanGuChun"));//gaoMiDuZhiDanGuChun@
        double 糖化血红蛋白 = preParamDouble(request.getParameter("tangHuaXueHongDanBai"));//tangHuaXueHongDanBai@
        double c反应蛋白 = preParamDouble(request.getParameter("fanYingDanBai"));//fanYingDanBai@
        int 肌酸激酶 = preParamInt(request.getParameter("jiSuanJiMei"));//jiSuanJiMei@
        int 乳酸脱氢酶 = preParamInt(request.getParameter("ruSuanTuoQingMei"));//ruSuanTuoQingMei@
        int 钠 = preParamInt(request.getParameter("na"));//na@
        int 镁 = preParamInt(request.getParameter("mei"));//mei@
        int 谷草转氨酶 = preParamInt(request.getParameter("guSaoZhuanAnMei"));//guSaoZhuanAnMei@
        int 肌酐 = preParamInt(request.getParameter("jiGan"));//jiGan@
        double 总胆固醇 = preParamDouble(request.getParameter("zongDanGuChun"));//zongDanGuChun@
        double 低密度脂蛋白胆固醇 = preParamDouble(request.getParameter("diMiDuZhiDanGuChun"));//diMiDuZhiDanGuChun@
        int 同型半胱氨酸 = preParamInt(request.getParameter("tongXingBanTaiAnSuan"));//tongXingBanTaiAnSuan@
        double 尿酸 = preParamDouble(request.getParameter("niaoSuan"));//niaoSuan@
        
        //基因参数
        int rs11064524 = preParamInt(request.getParameter("rs11064524targetspot"));//rs11064524targetspot@
        int rs3772616 = preParamInt(request.getParameter("rs3772616targetspot"));//rs3772616targetspot@
        int rs275649 = preParamInt(request.getParameter("rs275649targetspot"));
        int rs17030613 = preParamInt(request.getParameter("rs17030613targetspot"));
        int rs3736556 = preParamInt(request.getParameter("rs3736556targetspot"));
        int rs2638360 = preParamInt(request.getParameter("rs2638360targetspot"));
        int rs4980974 = preParamInt(request.getParameter("rs4980974targetspot"));
        int rs5194 = preParamInt(request.getParameter("rs5194targetspot"));
        int rs4757391 = preParamInt(request.getParameter("rs4757391targetspot"));
        int rs5193 = preParamInt(request.getParameter("rs5193targetspot"));
        int rs11608756 = preParamInt(request.getParameter("rs11608756targetspot"));
        int rs2131127 = preParamInt(request.getParameter("rs2131127targetspot"));
        int rs7305099 = preParamInt(request.getParameter("rs7305099targetspot"));
        int rs880054 = preParamInt(request.getParameter("rs880054targetspot"));
        int rs12828016 = preParamInt(request.getParameter("rs12828016targetspot"));
        int rs2051852 = preParamInt(request.getParameter("rs2051852targetspot"));
        int rs4980973 = preParamInt(request.getParameter("rs4980973targetspot"));
        int rs820430 = preParamInt(request.getParameter("rs820430targetspot"));
        int rs10849558 = preParamInt(request.getParameter("rs10849558targetspot"));
        int rs388915 = preParamInt(request.getParameter("rs388915targetspot"));
        int rs5186 = preParamInt(request.getParameter("rs5186targetspot"));
        int rs11067763 = preParamInt(request.getParameter("rs11067763targetspot"));
        int rs10774461 = preParamInt(request.getParameter("rs10774461targetspot"));
        int rs4409766 = preParamInt(request.getParameter("rs4409766targetspot"));
        int rs1492100 = preParamInt(request.getParameter("rs1492100targetspot"));
        int rs11611231 = preParamInt(request.getParameter("rs11611231targetspot"));
        int rs2074192 = preParamInt(request.getParameter("rs2074192targetspot"));
        int rs13143871 = preParamInt(request.getParameter("rs13143871targetspot"));
        int rs35444 = preParamInt(request.getParameter("rs35444targetspot"));
        int rs1191548 = preParamInt(request.getParameter("rs1191548targetspot"));
        int rs4838825 = preParamInt(request.getParameter("rs4838825targetspot"));
        int rs5182 = preParamInt(request.getParameter("rs5182targetspot"));
        int rs11066280 = preParamInt(request.getParameter("rs11066280targetspot"));
        int rs1887320 = preParamInt(request.getParameter("rs1887320targetspot"));
        int rs956868 = preParamInt(request.getParameter("rs956868targetspot"));
        int rs17249754 = preParamInt(request.getParameter("rs17249754targetspot"));
        int rs2106809 = preParamInt(request.getParameter("rs2106809targetspot"));
        int rs1991391 = preParamInt(request.getParameter("rs1991391targetspot"));
        int rs16849255 = preParamInt(request.getParameter("rs16849255targetspot"));
        int rs1902859 = preParamInt(request.getParameter("rs1902859targetspot"));
        int rs1800766 = preParamInt(request.getParameter("rs1800766targetspot"));
        int rs7972490 = preParamInt(request.getParameter("rs7972490targetspot"));
        int rs9426748 = preParamInt(request.getParameter("rs9426748targetspot"));
        int rs7079 = preParamInt(request.getParameter("rs7079targetspot"));
        int rs5370 = preParamInt(request.getParameter("rs5370targetspot"));
        int rs6632677 = preParamInt(request.getParameter("rs6632677targetspot"));
        int rs1630736 = preParamInt(request.getParameter("rs1630736targetspot"));
        int rs9810888 = preParamInt(request.getParameter("rs9810888targetspot"));
        int rs1173766 = preParamInt(request.getParameter("rs1173766targetspot"));
        int rs11571078 = preParamInt(request.getParameter("rs11571078targetspot"));
        int rs3820189 = preParamInt(request.getParameter("rs3820189targetspot"));
        int rs3753579 = preParamInt(request.getParameter("rs3753579targetspot"));
        int rs1042717 = preParamInt(request.getParameter("rs1042717targetspot"));
        int rs17037564 = preParamInt(request.getParameter("rs17037564targetspot"));
        int rs1042719 = preParamInt(request.getParameter("rs1042719targetspot"));
        int rs3802228 = preParamInt(request.getParameter("rs3802228targetspot"));
        int rs10088365 = preParamInt(request.getParameter("rs10088365targetspot"));
        int rs11240688 = preParamInt(request.getParameter("rs11240688targetspot"));
        int rs6693954 = preParamInt(request.getParameter("rs6693954targetspot"));
        int rs1042713 = preParamInt(request.getParameter("rs1042713targetspot"));
        int rs3889728 = preParamInt(request.getParameter("rs3889728targetspot"));
        int rs11568023 = preParamInt(request.getParameter("rs11568023targetspot"));
        int rs2774028 = preParamInt(request.getParameter("rs2774028targetspot"));
        int rs11122575 = preParamInt(request.getParameter("rs11122575targetspot"));
        int rs2336384 = preParamInt(request.getParameter("rs2336384targetspot"));
        int rs2295281 = preParamInt(request.getParameter("rs2295281targetspot"));
        int rs7539020 = preParamInt(request.getParameter("rs7539020targetspot"));
        int rs1464816 = preParamInt(request.getParameter("rs1464816targetspot"));
        int rs2236058 = preParamInt(request.getParameter("rs2236058targetspot"));
        int rs212515 = preParamInt(request.getParameter("rs212515targetspot"));
        int rs3827750 = preParamInt(request.getParameter("rs3827750targetspot"));
        int rs2076283 = preParamInt(request.getParameter("rs2076283targetspot"));
        int rs1042714 = preParamInt(request.getParameter("rs1042714targetspot"));
        int rs4461142 = preParamInt(request.getParameter("rs4461142targetspot"));
        int rs2236847 = preParamInt(request.getParameter("rs2236847targetspot"));
        int rs2236057 = preParamInt(request.getParameter("rs2236057targetspot"));
        int rs115071 = preParamInt(request.getParameter("rs115071targetspot"));
        int rs212544 = preParamInt(request.getParameter("rs212544targetspot"));
        int rs11590928 = preParamInt(request.getParameter("rs11590928targetspot"));
        int rs1799998 = preParamInt(request.getParameter("rs1799998targetspot"));
        int rs2076280 = preParamInt(request.getParameter("rs2076280targetspot"));
        int rs2282715 = preParamInt(request.getParameter("rs2282715targetspot"));
        int rs3766741 = preParamInt(request.getParameter("rs3766741targetspot"));
        int rs2493132 = preParamInt(request.getParameter("rs2493132targetspot"));
        int rs2478523 = preParamInt(request.getParameter("rs2478523targetspot"));
        int rs6433 = preParamInt(request.getParameter("rs6433targetspot"));
        int rs2478545 = preParamInt(request.getParameter("rs2478545targetspot"));
        int rs699 = preParamInt(request.getParameter("rs699targetspot"));
        int rs4344 = preParamInt(request.getParameter("rs4344targetspot"));
        int rs880315 = preParamInt(request.getParameter("rs880315targetspot"));
        int rs5050 = preParamInt(request.getParameter("rs5050targetspot"));
        int rs4762 = preParamInt(request.getParameter("rs4762targetspot"));
        int rs3789671 = preParamInt(request.getParameter("rs3789671targetspot"));
        int rs4994 = preParamInt(request.getParameter("rs4994targetspot"));
        int rs6801836 = preParamInt(request.getParameter("rs6801836targetspot"));
        int rs10774457 = preParamInt(request.getParameter("rs10774457targetspot"));
        int rs6825911 = preParamInt(request.getParameter("rs6825911targetspot"));
        int rs11658531 = preParamInt(request.getParameter("rs11658531targetspot"));
		
		String path = request.getRealPath("");
		//D:\shengxin_workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\bcc_gaoxy\WEB-INF
//		String cmds = "D:\\Program Files\\R\\R-3.2.3\\bin\\i386\\Rscript "+path+"\\WEB-INF\\classes\\com\\turing\\yuce\\model.R " + gene + " " + age + " " + bmi + " " + salt ; // 注意：对字符串中路径\进行转义
		//C:\Program Files (x86)\Apache Software Foundation\Tomcat 6.0\webapps\bcc_gaoxy\WEB-INF\classes\com\turing\yuce
		
		//原命令行
		//String cmds = "C:\\Program Files\\R\\R-3.2.3\\bin\\x64\\Rscript c:\\model.R " + gene + " " + age + " " + bmi + " " + salt ; // 注意：对字符串中路径\进行转义
		
		//新命令行
		String cmds = "C:\\Program Files\\R\\R-3.2.3\\bin\\x64\\Rscript c:\\svm2.R "+" "+身高+" "+体重+" "+腰围+" "+性别+" "+年龄+" "+民族+" "+您在北京居住时间是否超过15年+" "+婚姻状况+" "+职业+" "+文化程度+" "+医药费报销方式+" "+现在吸烟情况+" "+现在平均每天吸烟量+" "+饮酒情况+" "+白酒+" "+啤酒+" "+红酒+" "+饮酒量+" "+平均饮酒频率+" "+高血压家族史+" "+糖尿病家族史+" "+冠心病家族史+" "+急性心肌梗死家族史+" "+脑卒中家族史+" "+高血压病史+" "+患高血压年限+" "+有几种高血压并发症+" "+最近两周服药情况+" "+血脂异常情况+" "+脂肪肝情况+" "+患心肌梗死情况+" "+患脑卒中情况+" "+是否经常体育锻炼+" "+每次运动持续时间+" "+每周20分钟以上运动次数+" "+臀围+" "+心率+" "+心电图Sv1+" "+心电图Rv5+" "+谷丙转氨酶+" "+尿素+" "+血糖+" "+甘油三酯+" "+高密度脂蛋白胆固醇+" "+糖化血红蛋白+" "+c反应蛋白+" "+肌酸激酶+" "+乳酸脱氢酶+" "+钠+" "+镁+" "+谷草转氨酶+" "+肌酐+" "+总胆固醇+" "+低密度脂蛋白胆固醇+" "+同型半胱氨酸+" "+尿酸+" "+rs11064524+" "+rs3772616+" "+rs275649+" "+rs17030613+" "+rs3736556+" "+rs2638360+" "+rs4980974+" "+rs5194+" "+rs4757391+" "+rs5193+" "+rs11608756+" "+rs2131127+" "+rs7305099+" "+rs880054+" "+rs12828016+" "+rs2051852+" "+rs4980973+" "+rs820430+" "+rs10849558+" "+rs388915+" "+rs5186+" "+rs11067763+" "+rs10774461+" "+rs4409766+" "+rs1492100+" "+rs11611231+" "+rs2074192+" "+rs13143871+" "+rs35444+" "+rs1191548+" "+rs4838825+" "+rs5182+" "+rs11066280+" "+rs1887320+" "+rs956868+" "+rs17249754+" "+rs2106809+" "+rs1991391+" "+rs16849255+" "+rs1902859+" "+rs1800766+" "+rs7972490+" "+rs9426748+" "+rs7079+" "+rs5370+" "+rs6632677+" "+rs1630736+" "+rs9810888+" "+rs1173766+" "+rs11571078+" "+rs3820189+" "+rs3753579+" "+rs1042717+" "+rs17037564+" "+rs1042719+" "+rs3802228+" "+rs10088365+" "+rs11240688+" "+rs6693954+" "+rs1042713+" "+rs3889728+" "+rs11568023+" "+rs2774028+" "+rs11122575+" "+rs2336384+" "+rs2295281+" "+rs7539020+" "+rs1464816+" "+rs2236058+" "+rs212515+" "+rs3827750+" "+rs2076283+" "+rs1042714+" "+rs4461142+" "+rs2236847+" "+rs2236057+" "+rs115071+" "+rs212544+" "+rs11590928+" "+rs1799998+" "+rs2076280+" "+rs2282715+" "+rs3766741+" "+rs2493132+" "+rs2478523+" "+rs6433+" "+rs2478545+" "+rs699+" "+rs4344+" "+rs880315+" "+rs5050+" "+rs4762+" "+rs3789671+" "+rs4994+" "+rs6801836+" "+rs10774457+" "+rs6825911+" "+rs11658531; // 注意：对字符串中路径\进行转义
	    
		System.out.println(cmds);
		process = Runtime.getRuntime().exec(cmds);
		br = new BufferedReader(new InputStreamReader(process.getInputStream(),
				"utf-8"));
		String line = null;
		System.out.println("列出结果信息：");
		String[] strs = new String[4];
		int i=0;
		while ((line = br.readLine()) != null) {
			strs[i] = line;
			i++;
			System.out.println(line);
		}
		br.close();
		
		//request.setAttribute("gy", strs[1]);
		//request.setAttribute("dy", strs[3]);
		request.setAttribute("result", "您患高血压的风险："+strs[0]); 
		request.getRequestDispatcher("/yucechuli.jsp").forward(request, response);
	}
	/**
	 * 参数预处理，字符串转换整数，无法转换的处理为零
	 * @param param
	 * @return
	 */
	private Integer preParamInt(String param){
		int shu = 0;
		if (param==null) {
		} else {
			try {
				shu = Integer.parseInt(param);
			} catch (NumberFormatException e) {
				shu = 0;
			}
		}
		return shu;
	}
	/**
	 * 参数预处理，字符串转换double类型，无法转换的处理为零
	 * @param param
	 * @return
	 */
	private Double preParamDouble(String param){
		double shu = 0.0;
		if (param==null) {
		} else {
			try {
				shu = Double.parseDouble(param);
			} catch (NumberFormatException e) {
				shu = 0.0;
			}
		}
		return shu;
	}
	//OO
	//JavaEE
	//Android
	

}
