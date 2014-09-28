unit UPriceSmetAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxDropDownEdit, cxCalc, cxTextEdit, cxControls, cxContainer, cxEdit,
  cxMaskEdit, cxButtonEdit, DB, FIBDataSet, pFIBDataSet;

type
  TfrmPriceSmetAdd = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    SmText: TcxButtonEdit;
    RzText: TcxTextEdit;
    StText: TcxTextEdit;
    KekvText: TcxButtonEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LabelSm: TLabel;
    LabelRz: TLabel;
    LabelSt: TLabel;
    LabelKekv: TLabel;
    PercentValue: TcxCalcEdit;
    Label9: TLabel;
    ReadDataset: TpFIBDataSet;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure KekvTextPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure SmTextPropertiesEditValueChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SmTextKeyPress(Sender: TObject; var Key: Char);
    procedure RzTextKeyPress(Sender: TObject; var Key: Char);
    procedure StTextKeyPress(Sender: TObject; var Key: Char);
    procedure KekvTextKeyPress(Sender: TObject; var Key: Char);
    procedure PercentValueKeyPress(Sender: TObject; var Key: Char);
    procedure RzTextPropertiesEditValueChanged(Sender: TObject);
    procedure StTextPropertiesEditValueChanged(Sender: TObject);
    procedure KekvTextPropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
    CurrentServerDate : TDate;
    function CheckData:Boolean;
  public
    { Public declarations }
    id_smeta:int64;
    id_razdel:int64;
    id_stat:int64;
    id_kekv:int64;
  end;

implementation

uses GlobalSpr, UPriceSmet;
const kav = '''';

{$R *.dfm}

function TfrmPriceSmetAdd.CheckData: Boolean;
begin
      if (SmText.Text='')or(RzText.Text='')or(StText.Text='')or(KekvText.Text='')
      then Result:=false
      else Result:=true;
end;

procedure TfrmPriceSmetAdd.cxButton1Click(Sender: TObject);
begin
      if checkdata
      then ModalResult:=mrYes
      else ShowMessage('Треба ввести всі параметри!');
end;

procedure TfrmPriceSmetAdd.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmPriceSmetAdd.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var id:Variant;
begin
    id:=GlobalSPR.GetSmets(self,
                           TfrmGetValueSmet(Owner).GetInfoDataSet.Database.Handle,
                           Date,
                           psmRazdSt);
    if VarArrayDimCount(id)>0
    then begin
              id_smeta:=id[0];
              id_razdel:=id[1];
              id_stat:=id[2];
              SmText.Text:=VarToStr(id[9]);
              LabelSm.Caption:=VarToStr(id[9])+' "'+VarToStr(id[6])+'"';

              RzText.Text:=VarToStr(id[7]);
              LabelRz.Caption:=VarToStr(id[7])+' "'+VarToStr(id[4])+'"';

              StText.Text:=VarToStr(id[8]);
              LabelSt.Caption:=VarToStr(id[8])+' "'+VarToStr(id[5])+'"';
    end;
end;


procedure TfrmPriceSmetAdd.KekvTextPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var id:Variant;
begin
    id:=GlobalSpr.GetKEKVSpr(self,
                             TfrmGetValueSmet(Owner).GetInfoDataSet.Database.Handle,
                             fsNormal,
                             Date,
                             DEFAULT_ROOT_ID);
    if VarArrayDimCount(id)>0
    then begin
              id_kekv:=id[0][0];
              KekvText.Text:=VarToStr(id[0][2]);
              LabelKekv.Caption:=VarToStr(id[0][2])+' "'+VarToStr(id[0][1])+'"';
    end;
end;

procedure TfrmPriceSmetAdd.SmTextPropertiesEditValueChanged(
  Sender: TObject);
begin
if SmText.Text= '' then exit;
{ if not cn_Common_Funcs.IntegerCheck(Smeta_Edit.Text) then begin
  ShowMessage('Введен неверный код.');
  Smeta_description_Label.Clear;
  Smeta_description_Label.Visible:=false;
  Smeta_Edit.SetFocus;
  exit;
 end;
}

 ReadDataSet.SQLs.SelectSQL.Text := 'select ID_OBJECT, TITLE_OBJECT from PUB_GET_NAME_BUDG_BY_KOD ( '+SmText.Text+','+kav+ datetostr(CurrentServerDate)+kav+',' +'1)';
 ReadDataSet.Open;

  if ReadDataSet['ID_OBJECT']<> null then begin
  ID_SMETA  := ReadDataSet['ID_OBJECT'];
 if ReadDataSet['TITLE_OBJECT']<> null then begin
  LabelSm.Caption:= ReadDataSet['TITLE_OBJECT'];
  end;
  end
 else begin
  ShowMessage('Даного коду не знайдено!');
  LabelSm.Caption := '___________';
  SmText.SetFocus;
  ReadDataSet.close;
  exit;
 end;

 ReadDataSet.close;

end;

procedure TfrmPriceSmetAdd.FormCreate(Sender: TObject);
begin
 ReadDataset.Database := TfrmGetValueSmet(Owner).GetInfoDataSet.Database;

 ReadDataSet.SQLs.SelectSQL.Text := 'select CUR_DATE from ST_GET_CURRENT_DATE';
 ReadDataSet.Open;
 CurrentServerDate:= ReadDataSet['CUR_DATE'];
 ReadDataSet.close;
end;

procedure TfrmPriceSmetAdd.SmTextKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then RzText.SetFocus;
end;

procedure TfrmPriceSmetAdd.RzTextKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then StText.SetFocus;
end;

procedure TfrmPriceSmetAdd.StTextKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then KekvText.SetFocus;
end;

procedure TfrmPriceSmetAdd.KekvTextKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then PercentValue.SetFocus;
end;

procedure TfrmPriceSmetAdd.PercentValueKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then cxButton1.SetFocus;
end;

procedure TfrmPriceSmetAdd.RzTextPropertiesEditValueChanged(
  Sender: TObject);
begin
if RzText.Text= '' then exit;

 ReadDataSet.SQLs.SelectSQL.Text := 'select ID_OBJECT, TITLE_OBJECT from PUB_GET_NAME_BUDG_BY_KOD ( '+RzText.Text+','+kav+ datetostr(CurrentServerDate) +kav+',' +'2)';
 ReadDataSet.Open;

  if ReadDataSet['ID_OBJECT']<> null then begin
  id_razdel  := ReadDataSet['ID_OBJECT'];
 if ReadDataSet['TITLE_OBJECT']<> null then begin
  LabelRz.Caption:= ReadDataSet['TITLE_OBJECT'];
  end;
  end
 else begin
  ShowMessage('Даного коду не знайдено!');
  LabelRz.Caption := '___________';
  RzText.SetFocus;
  ReadDataSet.close;
  exit;
 end;

 ReadDataSet.close;
end;

procedure TfrmPriceSmetAdd.StTextPropertiesEditValueChanged(
  Sender: TObject);
begin
if StText.Text= '' then exit;

 ReadDataSet.SQLs.SelectSQL.Text := 'select ID_RAZD_ST, RAZD_ST_TITLE from ST_GET_ID_STAT_BY_CODE ('+ IntToStr(id_razdel) +','+ StText.Text +')';
 ReadDataSet.Open;

  if ReadDataSet['ID_RAZD_ST']<> null then begin
  id_stat  := ReadDataSet['ID_RAZD_ST'];
 if ReadDataSet['RAZD_ST_TITLE']<> null then begin
  LabelSt.Caption:= ReadDataSet['RAZD_ST_TITLE'];
  end;
  end
 else begin
  ShowMessage('Даного коду не знайдено!');
  LabelSt.Caption := '___________';
  StText.SetFocus;
  ReadDataSet.close;
  exit;
 end;

 ReadDataSet.close;
end;

procedure TfrmPriceSmetAdd.KekvTextPropertiesEditValueChanged(
  Sender: TObject);
begin
if KekvText.Text= '' then exit;


 ReadDataSet.SQLs.SelectSQL.Text := 'select ID_KEKV, KEKV_TITLE from PUB_SPR_KEKV_INFO_EX2 ( '+KekvText.Text+','+kav+datetostr(CurrentServerDate)+kav+')';
 ReadDataSet.Open;

  if ReadDataSet['ID_KEKV']<> null then begin
  ID_KEKV  := ReadDataSet['ID_KEKV'];
  if ReadDataSet['KEKV_TITLE']<> null then begin
  LabelKekv.Caption:= ReadDataSet['KEKV_TITLE'];
  end;
  end
 else begin
  ShowMessage('Даного коду не знайдено!');
  LabelKekv.Caption := '___________';
  KekvText.SetFocus;
  ReadDataSet.close;
  exit;
 end;
  ReadDataSet.close;
end;

end.
