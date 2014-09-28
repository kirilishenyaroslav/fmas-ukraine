unit UEditTemplate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxTextEdit, cxControls, cxContainer,
  cxEdit, cxMaskEdit, cxButtonEdit, StdCtrls, ExtCtrls, cxButtons,
  pFibStoredProc, cxCheckBox;

type
  TfrmEditTemplate = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    KR_SM: TcxButtonEdit;
    KR_RZ: TcxButtonEdit;
    KR_ST: TcxTextEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DB_SM: TcxButtonEdit;
    Label7: TLabel;
    DB_RZ: TcxButtonEdit;
    Label8: TLabel;
    DB_ST: TcxTextEdit;
    Label9: TLabel;
    TemplateTitle: TcxTextEdit;
    DB_SCH: TcxButtonEdit;
    Label10: TLabel;
    KR_SCH: TcxButtonEdit;
    Label11: TLabel;
    CR_BY_DT: TcxCheckBox;
    Label12: TLabel;
    DB_KEKV: TcxButtonEdit;
    Label13: TLabel;
    KR_KEKV: TcxButtonEdit;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit3PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit4PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure DB_SCHPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure KR_SCHPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure DB_KEKVPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure KR_KEKVPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    DB_ID_SCH: Int64;
    KR_ID_SCH: Int64;
    DB_ID_SM : Int64;
    KR_ID_SM : Int64;
    DB_ID_KEKV : Int64;
    KR_ID_KEKV : Int64;
    DB_ID_RZ : Int64;
    KR_ID_RZ : Int64;
    DB_ID_ST : Int64;
    KR_ID_ST : Int64;
    { Public declarations }
  end;

implementation

uses GlobalSpr, SysMain;
{$R *.dfm}

procedure TfrmEditTemplate.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfrmEditTemplate.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmEditTemplate.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var F:TSmetaFilterValues;
    Result:Variant;
    InfoStoredProc:TpFibStoredProc;
begin
    F.DateFilter:=false;
    F.GroupFilter:=false;
    Result:=GlobalSpr.GetSmetaSpr(self,TfrmSysOptions(self.owner).WorkDatabase.Handle,fsNormal,Date,F,0);
    if  Result<>Variant(0)
    then begin
              KR_ID_SM := Result;
              InfoStoredProc:=TpFibStoredProc.Create(self);
              InfoStoredProc.Database:=TfrmSysOptions(Owner).WorkDatabase;
              InfoStoredProc.Transaction:=TfrmSysOptions(Owner).ReadTransaction;
              InfoStoredProc.StoredProcName:='PUB_SPR_SMETA_INFO';
              InfoStoredProc.Prepare;
              InfoStoredProc.ParamByName('ID_SMETA').AsInt64:=KR_ID_SM;
              InfoStoredProc.ExecProc;
              KR_SM.Text:=InfoStoredProc.ParamByName('SMETA_KOD').AsString;
              InfoStoredProc.Free;
    end;
end;

procedure TfrmEditTemplate.cxButtonEdit3PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var F:TSmetaFilterValues;
    Result:Variant;
    InfoStoredProc:TpFibStoredProc;
begin
    F.DateFilter:=false;
    F.GroupFilter:=false;
    Result:=GlobalSpr.GetSmetaSpr(self,TfrmSysOptions(self.owner).WorkDatabase.Handle,fsNormal,Date,F,0);
    if  Result<>NULL
    then begin
              DB_ID_SM := Result;
              InfoStoredProc:=TpFibStoredProc.Create(self);
              InfoStoredProc.Database:=TfrmSysOptions(Owner).WorkDatabase;
              InfoStoredProc.Transaction:=TfrmSysOptions(Owner).ReadTransaction;
              InfoStoredProc.StoredProcName:='PUB_SPR_SMETA_INFO';
              InfoStoredProc.Prepare;
              InfoStoredProc.ParamByName('ID_SMETA').AsInt64:=DB_ID_SM;
              InfoStoredProc.ExecProc;
              DB_SM.Text:=InfoStoredProc.ParamByName('SMETA_KOD').AsString;
              InfoStoredProc.Free;
    end;
end;

procedure TfrmEditTemplate.cxButtonEdit2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
   Result:Variant;
   InfoStoredProc:TpFibStoredProc;
begin
  Result:=GlobalSpr.GetRazdStSpr(self,
                                 TfrmSysOptions(Owner).WorkDatabase.Handle,
                                 fsNormal,
                                 Date,
                                 1,
                                 allEnable,
                                 cmSt);
  if Result<>null
  then begin
              KR_ID_ST:=VarAsType(Result,varInt64);
              InfoStoredProc:=TpFibStoredProc.Create(self);
              InfoStoredProc.Database:=TfrmSysOptions(Owner).WorkDatabase;
              InfoStoredProc.Transaction:=TfrmSysOptions(Owner).ReadTransaction;
              InfoStoredProc.StoredProcName:='PUB_SPR_RAZD_ST_INFO';
              InfoStoredProc.Prepare;
              InfoStoredProc.ParamByName('ID_RAZD_ST_IN').AsInt64:=KR_ID_ST;
              InfoStoredProc.ExecProc;
              KR_ID_RZ:=InfoStoredProc.ParamByName('LINKTO').asInt64;
              KR_ST.Text:=InfoStoredProc.ParamByName('RAZD_ST_NUM').AsString;

              InfoStoredProc.Prepare;
              InfoStoredProc.ParamByName('ID_RAZD_ST_IN').AsInt64:=KR_ID_RZ;
              InfoStoredProc.ExecProc;
              KR_RZ.Text:=InfoStoredProc.ParamByName('RAZD_ST_NUM').AsString;

              InfoStoredProc.Free;
  end;
end;

procedure TfrmEditTemplate.cxButtonEdit4PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
   Result:Variant;
   InfoStoredProc:TpFibStoredProc;
begin
  Result:=GlobalSpr.GetRazdStSpr(self,
                                 TfrmSysOptions(Owner).WorkDatabase.Handle,
                                 fsNormal,
                                 Date,
                                 1,
                                 allEnable,
                                 cmSt);
  if Result<>null
  then begin
              DB_ID_ST:=VarAsType(Result,varInt64);
              InfoStoredProc:=TpFibStoredProc.Create(self);
              InfoStoredProc.Database:=TfrmSysOptions(Owner).WorkDatabase;
              InfoStoredProc.Transaction:=TfrmSysOptions(Owner).ReadTransaction;
              InfoStoredProc.StoredProcName:='PUB_SPR_RAZD_ST_INFO';
              InfoStoredProc.Prepare;
              InfoStoredProc.ParamByName('ID_RAZD_ST_IN').asInt64:=DB_ID_ST;
              InfoStoredProc.ExecProc;
              DB_ID_RZ:=InfoStoredProc.ParamByName('LINKTO').AsInt64;
              DB_ST.Text:=InfoStoredProc.ParamByName('RAZD_ST_NUM').AsString;

              InfoStoredProc.Prepare;
              InfoStoredProc.ParamByName('ID_RAZD_ST_IN').asInt64:=DB_ID_RZ;
              InfoStoredProc.ExecProc;
              DB_RZ.Text:=InfoStoredProc.ParamByName('RAZD_ST_NUM').AsString;

              InfoStoredProc.Free;
  end;
end;

procedure TfrmEditTemplate.DB_SCHPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Res:Variant;
begin
    Res:=GlobalSpr.GetSch(self,TfrmSysOptions(Owner).WorkDatabase.Handle,fsNormal,Date,1,0,DB_ID_SCH);
    if VarArrayDimCount(Res)>0
    then begin
               DB_ID_SCH:=RES[0][0];
               DB_SCH.Text:=VarToStr(RES[0][3]);
    end;
end;

procedure TfrmEditTemplate.KR_SCHPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Res:Variant;
begin
    Res:=GlobalSpr.GetSch(self,TfrmSysOptions(Owner).WorkDatabase.Handle,fsNormal,Date,1,0,KR_ID_SCH);
    if VarArrayDimCount(Res)>0
    then begin
               KR_ID_SCH:=RES[0][0];
               KR_SCH.Text:=VarToStr(RES[0][3]);
    end;
end;

procedure TfrmEditTemplate.DB_KEKVPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Res:Variant;
begin
    Res:=GlobalSpr.GetKEKVSpr(self,TfrmSysOptions(Owner).WorkDatabase.Handle,fsNormal,Date,1);
    if VarArrayDimCount(Res)>0
    then begin
         DB_ID_KEKV:=Res[0][0];
         DB_KEKV.Text:=VarToStr(Res[0][2]);
    end;
end;

procedure TfrmEditTemplate.KR_KEKVPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Res:Variant;
begin
    Res:=GlobalSpr.GetKEKVSpr(self,TfrmSysOptions(Owner).WorkDatabase.Handle,fsNormal,Date,1);
    if VarArrayDimCount(Res)>0
    then begin
         KR_ID_KEKV:=Res[0][0];
         KR_KEKV.Text:=VarToStr(Res[0][2]);
    end;
end;

end.
