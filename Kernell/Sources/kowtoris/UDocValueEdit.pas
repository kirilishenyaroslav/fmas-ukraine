unit UDocValueEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, Ibase,
  cxDropDownEdit, cxCalc, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, pFibDataSet, pFibDatabase;

type
  TfrmEditValue = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButtonEdit1: TcxButtonEdit;
    cxButtonEdit2: TcxButtonEdit;
    Label1: TLabel;
    Label2: TLabel;
    cxCalcEdit1: TcxCalcEdit;
    Label3: TLabel;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
    F_DB:TpFibDatabase;
    F_TR:TpFibTransaction;
  public
    { Public declarations }
    id_rz:Integer;
    id_kv:Integer;
    constructor Create(AOwner:TComponent;FDB:TpFibDatabase;FTr:TpFibTransaction;id_user:Int64);reintroduce;
  end;

implementation

uses GlobalSpr;

{$R *.dfm}

constructor TfrmEditValue.Create(AOwner:TComponent;FDB:TpFibDatabase;FTr:TpFibTransaction;id_user:Int64);
begin
     inherited Create(AOwner);
     F_DB:=FDB;
     F_TR:=FTr;
end;

procedure TfrmEditValue.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfrmEditValue.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmEditValue.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var Res:Variant;
      GetInfoDS:TpFibDataSet;
begin
     Res:=GetRazdStSpr(self,   F_DB.Handle,  fsNormal,    Date,    0,  allRazdOnly,  cmRazd);
     if (Res>0)
     then begin
               id_rz:=VarAsType(Res,varInteger);
               GetInfoDS:=TpFibDataSet.Create(self);
               GetInfoDS.Database:=F_DB;
               GetInfoDS.Transaction:=F_TR;
               GetInfoDS.SelectSQL.Text:='SELECT * FROM pub_spr_razd_st WHERE ID_razd_st='+IntToStr(id_rz);
               GetInfoDS.Open;
               if (GetInfoDS.RecordCount>0)
               then begin
                         cxButtonEdit1.Text:=GetInfoDS.FieldByName('razd_st_num').AsString+' "'+
                         GetInfoDS.FieldByName('razd_st_title').AsString+'"';
               end;
               GetInfoDS.Close;
               GetInfoDS.Free;
     end
end;

procedure TfrmEditValue.cxButtonEdit2PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var id:Variant;
    GetInfoDS:TpFibDataSet;
begin
    id:=GlobalSpr.GetKEKVSpr(self,F_DB.Handle,fsNormal,Date,DEFAULT_ROOT_ID);
    if VarArrayDimCount(id)>0
    then begin
              id_kv:=id[0][0];
              GetInfoDS:=TpFibDataSet.Create(self);
              GetInfoDS.Database:=F_DB;
              GetInfoDS.Transaction:=F_TR;
              GetInfoDS.SelectSQL.Text:='SELECT * FROM pub_sp_kekv_select('+''''+DateToStr(Date)+''''+',null) where id_kekv='+IntToStr(id[0][0]);
              GetInfoDS.Open;
              if (GetInfoDS.RecordCount>0)
              then begin
                         cxButtonEdit2.Text:=GetInfoDS.FieldByName('kekv_code').AsString+' "'+
                         GetInfoDS.FieldByName('kekv_title').AsString+'"';
              end;
              GetInfoDS.Close;
              GetInfoDS.Free;
    end;
end;

end.
