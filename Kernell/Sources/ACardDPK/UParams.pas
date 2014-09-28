unit UParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxLabel, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, pFibDataSet,
  GlobalSpr, pFIBDatabase, cxMemo;

type
  TfrmEditMainParams = class(TForm)
    cxButtonEdit1: TcxButtonEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxButtonEdit2: TcxButtonEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxMemo1: TcxMemo;
    cxLabel3: TcxLabel;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
    FDB:TpFibDataBase;
    FTR:TpFibTransaction;
    FId_user:Integer;
  public
    id_tfin:Integer;
    tfin_kod:string;
    tfin_title:string;
    id_pkv:Integer;
    pkv_kod  :string;
    pkv_title:string;

    constructor Create(AOwner:TComponent;DB:TpFibDataBase; Tr:TpFibTransaction; id_user:Integer); reintroduce;
    { Public declarations }
  end;


implementation

{$R *.dfm}

constructor TfrmEditMainParams.Create(AOwner: TComponent;
  DB: TpFibDataBase; Tr: TpFibTransaction; id_user:Integer);
begin
     inherited Create(AOwner);
     FDB:=DB;
     FTR:=TR;
     Fid_user:=id_user;
end;

procedure TfrmEditMainParams.cxButton1Click(Sender: TObject);
begin
     if (cxButtonEdit1.Text<>'') and (cxButtonEdit2.Text<>'')
     then begin
               ModalResult:=mrYes;
     end;
end;

procedure TfrmEditMainParams.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmEditMainParams.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Res:Variant;
    GetInfoDS:TpFibDataSet;
begin
     Res:=GlobalSpr.GetTypeFinance(self,
                                   FDB.Handle,
                                   fsNormal,
                                   fid_user);
     if (Res<>Variant(0))
     then begin
               id_tfin:=VarAsType(Res,varInteger);
               GetInfoDS:=TpFibDataSet.Create(self);
               GetInfoDS.Database:=FDB;
               GetInfoDS.Transaction:=FTR;
               GetInfoDS.SelectSQL.Text:='SELECT * FROM pub_sp_type_finance WHERE ID_TYPE_FINANCE='+IntToStr(id_tfin);
               GetInfoDS.Open;
               if (GetInfoDS.RecordCount>0)
               then begin
                         tfin_kod          :=GetInfoDS.FieldByName('TYPE_FINANCE_CODE').AsString;
                         tfin_title        :=GetInfoDS.FieldByName('TYPE_FINANCE_NAME').AsString;
                         cxButtonEdit1.Text:=tfin_kod+' "'+tfin_title+'"';
               end;
               GetInfoDS.Close;
               GetInfoDS.Free;
     end;
end;

procedure TfrmEditMainParams.cxButtonEdit2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Res:Variant;
    GetInfoDS:TpFibDataSet;
begin
     Res:=GlobalSpr.GetSmPKV(self,
                             FDB.Handle,
                             fsNormal,
                             fid_user);
     if (Res<>Variant(0))
     then begin
               id_pkv:=VarAsType(Res,varInteger);
               GetInfoDS:=TpFibDataSet.Create(self);
               GetInfoDS.Database:=FDB;
               GetInfoDS.Transaction:=FTR;
               GetInfoDS.SelectSQL.Text:='SELECT * FROM pub_sp_sm_pkv WHERE ID_PKV='+IntToStr(id_pkv);
               GetInfoDS.Open;
               if (GetInfoDS.RecordCount>0)
               then begin
                         pkv_kod  :=GetInfoDS.FieldByName('PKV_KOD').AsString;
                         pkv_title:=GetInfoDS.FieldByName('PKV_TITLE').AsString;
                         cxButtonEdit2.Text:=pkv_kod+' "'+pkv_title+'"';
               end;
               GetInfoDS.Close;
               GetInfoDS.Free;
     end;
end;

end.
