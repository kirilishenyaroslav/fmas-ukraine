//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USEPACKAGE("vcl50.bpi");
USERES("clinetsuiteb5.res");
USERES("clInetSuite.dcr");
USEUNIT("clActionInfo.pas");
USEUNIT("clBodyChooser.pas");
USEUNIT("clBodyEdit.pas");
USEUNIT("clCert.pas");
USEUNIT("clConnection.pas");
USEUNIT("clCookies.pas");
USEUNIT("clCryptAPI.pas");
USEUNIT("clCryptUtils.pas");
USEUNIT("clDC.pas");
USEUNIT("clDCUtils.pas");
USEUNIT("clDEditors.pas");
USEUNIT("clDnsMessage.pas");
USEUNIT("clDnsQuery.pas");
USEUNIT("clDownLoader.pas");
USEUNIT("clEncoder.pas");
USEUNIT("clFormChooser.pas");
USEUNIT("clFtp.pas");
USEUNIT("clFtpFileHandler.pas");
USEUNIT("clFtpServer.pas");
USEUNIT("clFtpUtils.pas");
USEUNIT("clGZip.pas");
USEUNIT("clHtmlParser.pas");
USEUNIT("clHttp.pas");
USEUNIT("clHttpAuth.pas");
USEUNIT("clHttpHeader.pas");
USEUNIT("clHttpMail.pas");
USEUNIT("clHttpRequest.pas");
USEUNIT("clHttpUtils.pas");
USEUNIT("clImap4.pas");
USEUNIT("clImap4FileHandler.pas");
USEUNIT("clImap4Server.pas");
USEUNIT("clImapUtils.pas");
USEUNIT("clInetSuiteReg.pas");
USEUNIT("clLogger.pas");
USEUNIT("clMailMessage.pas");
USEUNIT("clMC.pas");
USEUNIT("clMCUtils.pas");
USEUNIT("clMenuButton.pas");
USEUNIT("clMultiDC.pas");
USEUNIT("clMultiDownLoader.pas");
USEUNIT("clMultiUploader.pas");
USEUNIT("clNewsChecker.pas");
USEUNIT("clNntp.pas");
USEUNIT("clNntpServer.pas");
USEUNIT("clNntpUtils.pas");
USEUNIT("clPCRE.pas");
USEUNIT("clPCREDef.pas");
USEUNIT("clPop3.pas");
USEUNIT("clPop3FileHandler.pas");
USEUNIT("clPop3Server.pas");
USEUNIT("clProgressBar.pas");
USEUNIT("clRequestChooser.pas");
USEUNIT("clRequestEdit.pas");
USEUNIT("clSingleDC.pas");
USEUNIT("clSMimeMessage.pas");
USEUNIT("clSmtp.pas");
USEUNIT("clSmtpFileHandler.pas");
USEUNIT("clSmtpRelay.pas");
USEUNIT("clSmtpServer.pas");
USEUNIT("clSoap.pas");
USEUNIT("clSocket.pas");
USEUNIT("clSspi.pas");
USEUNIT("clSspiAuth.pas");
USEUNIT("clSspiUtils.pas");
USEUNIT("clStreams.pas");
USEUNIT("clSyncUtils.pas");
USEUNIT("clTcpClient.pas");
USEUNIT("clTcpServer.pas");
USEUNIT("clThreadPool.pas");
USEUNIT("clTlsSocket.pas");
USEUNIT("clTranslator.pas");
USEFORMNS("clUpdateInfoForm.pas", Clupdateinfoform, frmUpdateInfo);
USEUNIT("clUploader.pas");
USEUNIT("clUriUtils.pas");
USEUNIT("clUserMgr.pas");
USEUNIT("clUtils.pas");
USEUNIT("clWebDav.pas");
USEUNIT("clWebUpdate.pas");
USEUNIT("clWinInet.pas");
USEUNIT("clWinSock2.pas");
USEUNIT("clXmlUtils.pas");
USEUNIT("clZLibStreams.pas");
USEUNIT("msxml_tlb.pas");
USE("clVer.inc", File);
//---------------------------------------------------------------------------
#pragma package(smart_init)
//---------------------------------------------------------------------------

//   Package source.
//---------------------------------------------------------------------------

#pragma argsused
int WINAPI DllEntryPoint(HINSTANCE hinst, unsigned long reason, void*)
{
        return 1;
}
//---------------------------------------------------------------------------
