unit st_common_Mail;

interface
uses st_Common_DM;

Procedure Send_mail(Text_mail : string);

implementation

uses ComObj;

var
  DM : TDM_st_Common;

procedure Send_mail(Text_mail : string);
Begin
{  DM := TDM_st_Common.Create(nil);

  DM.IdSMTP1.AuthenticationType := atLogin;
  DM.IdSMTP1.Host := 'smtp.yandex.ru';
  DM.IdSMTP1.Username := 'support.sfm';
  DM.IdSMTP1.Password := '1developers1';

  //DM.IdMessage1.ContentType  := 'text/html';
  DM.IdMessage1.CharSet      := 'Windows-1251';

  DM.IdMessage1.From.Text := 'support.sfm@yandex.ru';                   //кто отправил
  DM.IdMessage1.Recipients.EMailAddresses := 'aperchak@donnu.edu.ua'; //кому отправил

  DM.IdMessage1.Subject := 'Error in system';                           //Тема
  DM.IdMessage1.Body.Clear;
  DM.IdMessage1.Body.Add(Text_mail);

  try
   DM.IdSMTP1.Connect;

   If DM.IdSMTP1.Connected then DM.IdSMTP1.Send(DM.IdMessage1);
   except

  end;

  DM.IdSMTP1.Disconnect;
  DM.Free;}
end;

end.
