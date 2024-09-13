package emp.get.set;

public class Employee {
			private String uname;
			private String pass;
			private String email;
			private String  pnum;
			
			
			public void setuname(String uname) {
				this.uname=uname;
			}
			public String getuname() {
				return uname;	
			}
			
			
			
			public void setpass(String pass) {
				this.pass=pass;	
			}
			public String getpass() {
				return pass;
			}
			
			
			
			public void setemail(String email) {
				this.email=email;
			}
			public String getemail() {
				return email;
			}
			
			
			
			public void setpnum( String pnum2 ) {
				this.pnum=pnum2;
			}
			public String getpnum() {
				return pnum;
			}

}
