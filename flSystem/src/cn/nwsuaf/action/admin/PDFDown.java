package cn.nwsuaf.action.admin;

import java.awt.Insets;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.security.InvalidParameterException;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.zefer.pd4ml.PD4Constants;
import org.zefer.pd4ml.PD4ML;

import com.opensymphony.xwork2.Action;

public class PDFDown {
	public String execute(){
		
		return Action.SUCCESS;
	}
	
	public InputStream  getDownloadFile() throws InvalidParameterException, MalformedURLException, IOException{
		PD4ML pd4ml = new PD4ML();
        pd4ml.setPageInsets(new Insets(20, 20, 20, 20));
        pd4ml.setHtmlWidth(1000);
        pd4ml.setPageSize(PD4Constants.A4);
        pd4ml.useTTF("java:fonts", true);
        pd4ml.setDefaultTTFs("simsun", "Arial", "Courier New");
        pd4ml.enableDebugInfo();
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        HttpServletRequest req = ServletActionContext.getRequest();
        String ctxp = req.getContextPath();
        String sc = req.getLocalPort() + "";
        pd4ml.render("http://localhost:"+sc + ctxp + "/pdfdemo.jsp", baos);
        return new ByteArrayInputStream(baos.toByteArray());
	}
	
	public String getFileName(){
		return "demo.pdf";
	}
}
