program EXCH_AbitCn;

uses
  Forms,
  uAbitCn in 'uAbitCn.pas' {FormAbitCn},
  uLoginAbitCn in 'Login\uLoginAbitCn.pas' {FormLoginAbitCn},
  DM in 'DM.pas' {DM_IE: TDataModule},
  WaitForm in 'WaitForm.pas' {Wait_Form},
  SynchrForm in 'SynchrForm.pas' {Synchr_Form},
  SelectForm in 'SelectForm.pas' {Select_Form},
  CryptDo in '..\EXCH_Crypt\CryptDo.pas' {fmCryptDo};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Абитуриент-Контракты';
  Application.CreateForm(TDM_IE, DM_IE);
  Application.CreateForm(TFormAbitCn, FormAbitCn);
  Application.CreateForm(TFormLoginAbitCn, FormLoginAbitCn);
  Application.CreateForm(TWait_Form, Wait_Form);
  Application.CreateForm(TfmCryptDo, fmCryptDo);
  //  Application.CreateForm(TSelect_Form, SelectForm);
  Application.Run;
end.
