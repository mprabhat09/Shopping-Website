<%@ Page  Language="C#" AutoEventWireup="true" CodeFile="MainPage.aspx.cs" Inherits="MainPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<form id="f" runat="server">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title></title>
	<link href="css/balancestyle.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="css/raccordion.css" />
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script src="js/jquery.raccordion.js" type="text/javascript"></script>
	<script src="js/jquery.animation.easing.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(window).load(function () {
			$('#accordion-wrapper').raccordion({
				speed: 1000,
				sliderWidth: 1000,
				sliderHeight: 300,
				autoCollapse: false
			});

		}); 
	</script>
</head>
<body>
	<div class="wrapper">
		<div id="logo">
			<table width="1000" cellpadding="0" cellspacing="0">
				<tr>
					<td height="60" colspan="2" align="center" valign="middle" class ="head">
					MyFashion-Online  Shopping
					</td>
				</tr>
				<tr>
					<td height="40" colspan="2" align="right" valign="middle">
						<asp:Label ID="lblUserId" runat="server">User Id</asp:Label>
						<asp:TextBox ID="txtUserId" runat="server" Width="80px"></asp:TextBox>
						<asp:requiredfieldvalidator id="ReqLoginname" runat="server" controltovalidate="txtUserId"
											display="None" errormessage="Enter Login Name " setfocusonerror="True" validationgroup="login">*</asp:requiredfieldvalidator>
						Password:<asp:TextBox ID="txtPwd" runat="server" Width="80px" 
							TextMode="Password"></asp:TextBox>
								<asp:requiredfieldvalidator id="ReqPassword" runat="server" controltovalidate="txtPwd"
										display="None" errormessage="Enter Password" setfocusonerror="True" text="*" validationgroup="login"></asp:requiredfieldvalidator>
						<asp:Button ID="btnLogin" runat="server" Text="login" OnClick="btnLogin_Click" validationgroup="login" CssClass ="button" />
						<asp:HyperLink ID ="h" runat ="server" NavigateUrl ="~/Registration.aspx" >Register</asp:HyperLink>
						<asp:validationsummary id="ValidationSummary1" runat="server" showmessagebox="True"
										showsummary="False" validationgroup="login" />
					</td>
				</tr>
				<tr>
					<td height="20" colspan="2" align="right" valign="middle">
						<asp:Label ID="lblloginmsg" runat="server" ForeColor="#FF3300"></asp:Label>
					</td>
				</tr>
			 
			</table>
		</div>
		<div id="accordion-wrapper">
			<div class="slide">
				<img src="images/h6.jpg" width="600" height ="300" />
			</div>
			<div class="slide">
				<img src="images/h7.jpg" width="600" height ="300" />
			</div>
			<div class="slide">
				<img src="images/h2.jpg" width="600" height ="300" />
			</div>
			<div class="slide">
				<img src="images/h1.jpg" width="600" height ="300" />
			</div>
			<div class="slide">
				<img src="images/h4.jpg" width="600" height ="300" />
			</div>
			<div class="slide">
				<img src="images/h5.jpg" width="600" height ="300" />
			</div>
		</div>
		<table width="995px" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="285" valign="top" style="border: thin solid #CCCCCC">
					<table width="285" align="left" cellpadding="0" cellspacing="0">
						<tr>
							<td height="35" align="left" valign="middle">
							</td>
							<td colspan="4" align="left" valign="middle" bgcolor="#CCCCCC">
								CATEGORY
							</td>
						</tr>
						<tr>
							<td width="37" height="35" align="left" valign="middle">
							</td>
							<td colspan="3" align="left" valign="middle">
								MEN
							</td>
						</tr>
						<tr>
							<td colspan="4" height="5px">
							</td>
						</tr>
						<tr>
							<td height="30">
							</td>
							<td height="30" colspan="3" align="left" valign="middle">
								WOMEN
							</td>
						</tr>
						<tr>
							<td colspan="4" height="5px">
							</td>
						</tr>
						<tr>
							<td height="30">
							</td>
							<td height="30" colspan="3" align="left" valign="middle">
								OTHERS
							</td>
						</tr>
						<tr>
							<td colspan="4">
								&nbsp;
							</td>
						</tr>
					</table>
				</td>
				<td width="708" align="left" valign="top">
					<table width="705" align="right" cellpadding="0" cellspacing="0" style="border: thin solid #CCCCCC">
						<tr>
							<td width="37" height="35" align="left">
							</td>
							<td colspan="4" align="left" valign="middle" bgcolor="#CCCCCC">
								Why choose Us ?
							</td>
						</tr>
						<tr>
							<td width="37" align="left" valign="middle">
								&nbsp;
							</td>
							<td colspan="4" align="left" valign="middle" class="txt2">
								Our mission is to democrate fashion in india<br />
								<p class="txt3">
									Our company is built on fashion model on the lines of leading global peers</p>
							</td>
						</tr>
						<tr>
							<td width="37" height="35" align="left">
							</td>
							<td colspan="4" align="left" valign="middle" bgcolor="#CCCCCC">
								Our Vision
							</td>
						</tr>
						<tr>
							<td align="left" valign="middle">
								&nbsp;
							</td>
							<td colspan="4" align="left" valign="middle" class="txt3">
								<p class="txt3">
									"Our [MyFashion] vision is to be earth's most customer centric company; to build a place where people can come to find and discover anything they might want to buy online."
									<br />
									Some Info.</p>
							</td>
						</tr>
						<tr>
							<td width="37" height="35" align="left">
							</td>
							<td colspan="4" align="left" valign="middle" bgcolor="#CCCCCC">
								Quality
							</td>
						</tr>
						<tr>
							<td width="37" align="left" valign="middle">
								&nbsp;
							</td>
							<td colspan="4" align="left" valign="middle" class="txt2">
								A higher end product occasionally bought by consumers that are usually compared for their appropriateness, quality, cost and features before purchase occurs. Consumers tend to take more time when purchasing a shopping good produced by a business, and they might even travel to buy such goods.
								<p class="txt3">
									</p>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="5" colspan="2" align="center" valign="middle" bgcolor="#CCCCCC">
				</td>
			</tr>
			<tr>
				<td  colspan="2" align="center" valign="middle">
					<img src="images/1000_header.jpg" alt="" width="1000" height="50" />
				</td>
			</tr>
		</table>
	</div>
</body>
</form>
</html>
