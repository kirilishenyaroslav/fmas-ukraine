unit UKowEditDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase, cxMemo, cxTextEdit, cxMaskEdit, cxButtonEdit, cxControls,
  cxContainer, cxEdit, cxLabel, pFibDataSet, pFibDataBase,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxDropDownEdit, cxCalendar,
  cxRadioGroup;

type
  TfrmDocEdit = class(TForm)
    cxLabel1: TcxLabel;
    cxButtonEdit2: TcxButtonEdit;
    cxLabel2: TcxLabel;
    cxButtonEdit1: TcxButtonEdit;
    cxLabel3: TcxLabel;
    cxMemo1: TcxMemo;
    cxLabel4: TcxLabel;
    cxDateEdit1: TcxDateEdit;
    cxLabel5: TcxLabel;
    cxTextEdit1: TcxTextEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxRadioButton1: TcxRadioButton;
    cxRadioButton2: TcxRadioButton;
    procedure cxButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
    Fhandle:TISC_DB_HANDLE;
    Fid_user:Int64;
    FDB:TpFibDataBase;
    FTR:TpFibTransaction;
  public
    { Public declarations }
    id_pkv:Integer;
    id_tf:Integer;
    num_doc:string;
    date_doc:TdateTime;
    pkv_kod  :String;
    pkv_title:String;
    tfin_kod:String;
    tfin_title:String;
    constructor Create(AOwner:TComponent;Db:TpFibdatabase;Tr:TpFibTransaction;id_user :Int64); reintroduce;
  end;

implementation

{$R *.dfm}

uses GlobalSpr;

{ TfrmDocEdit }

constructor TfrmDocEdit.Create(AOwner:TComponent;Db:TpFibdatabase;Tr:TpFibTransaction;id_user :Int64);
begin
     inherited Create(AOwner);
     FDB:=DB;
     FTR:=TR;
     FId_User:=Id_user;
     cxDateEdit1.Date:=Date;
end;

procedure TfrmDocEdit.cxButtonEdit2PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
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

procedure TfrmDocEdit.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Res:Variant;
    GetInfoDS:TpFibDataSet;
begin
     Res:=GlobalSpr.GetTypeFinance(self,
                                   FDB.Handle,
                                   fsNormal,
                                   fid_user);
     if (Res<>Variant(0))
     then begin
               id_tf:=VarAsType(Res,varInteger);
               GetInfoDS:=TpFibDataSet.Create(self);
               GetInfoDS.Database:=FDB;
               GetInfoDS.Transaction:=FTR;
               GetInfoDS.SelectSQL.Text:='SELECT * FROM pub_sp_type_finance WHERE ID_TYPE_FINANCE='+IntToStr(id_tf);
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

procedure TfrmDocEdit.cxButton1Click(Sender: TObject);
begin
      modalresult:=mrYes;
end;

procedure TfrmDocEdit.cxButton2Click(Sender: TObject);
begin
      modalresult:=mrNo;
end;

end.
