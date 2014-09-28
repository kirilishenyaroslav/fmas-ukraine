unit cn_FilterPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxButtonEdit, cxControls, cxGroupBox,
  cn_PriceReestrPrint, cn_Common_Types, ibase, cn_Common_Loader, Buttons,
  ActnList, frxDesgn, frxClass, DB, FIBDataSet, pFIBDataSet, frxDBSet;

type
  TfrmFilterPrint = class(TForm)
    btnOk: TcxButton;
    btnClose: TcxButton;
    Frame_GroupBox: TcxGroupBox;
    Studer_Label: TLabel;
    LowSpecimen_Label: TLabel;
    Studer_Edit: TcxButtonEdit;
    Fac_Edit: TcxButtonEdit;
    btnClear1: TSpeedButton;
    btnClear2: TSpeedButton;
    frxReport: TfrxReport;
    frxDesigner1: TfrxDesigner;
    ActionList1: TActionList;
    Action1: TAction;
    Label1: TLabel;
    frxDBDataset1: TfrxDBDataset;
    pReadDataSet: TpFIBDataSet;
    procedure btnCloseClick(Sender: TObject);
    procedure Studer_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure LowSpecimen_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnClear1Click(Sender: TObject);
    procedure btnClear2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
   ID_PRICE: Int64;
   ID_FACULTY : Int64;
  public
   isPreyskPrint : Integer;
   Db_Handle: TISC_DB_HANDLE;
   ID_YEAR: Int64;
   Years: string;
  end;

  var designer_rep:Integer;

  implementation

uses PricesMain;

{$R *.dfm}

procedure TfrmFilterPrint.btnCloseClick(Sender: TObject);
begin
Close;
end;

procedure TfrmFilterPrint.Studer_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
 var ViewForm: TfrmPriceReestrPrint;
begin
 ViewForm := TfrmPriceReestrPrint.Create(self);
 ViewForm.ID_YEAR := ID_YEAR;
 ViewForm.Caption := ViewForm.Caption + Years;
 if ViewForm.ShowModal = Mrok then
 begin
   Studer_Edit.Text := ViewForm.NamePrice;
   ID_PRICE         := ViewForm.ID_PRICE;
   Fac_Edit.Enabled := True;
   btnClear2Click(Sender);
 end;
end;

procedure TfrmFilterPrint.LowSpecimen_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
  var
  AParameter:TcnSimpleParams;
  res: Variant;
 begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= Db_Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.DontShowGroups:= True;
  AParameter.DontShowFacs:= True;
  AParameter.ID_PRICE:=ID_PRICE;
  res:=RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_FacultySpecGroup.bpl','ShowSPFacSpecGroup');
  AParameter.Free;
if VarArrayDimCount(res)>0 then
 begin
  ID_FACULTY := res[0];
  Fac_Edit.Text:= vartostr(res[3]);
 end;
end;

procedure TfrmFilterPrint.btnClear1Click(Sender: TObject);
begin
  Studer_Edit.Text := '';
  ID_PRICE := -1;
  btnClear2Click(Sender);
  Fac_Edit.Enabled:= False;
end;

procedure TfrmFilterPrint.btnClear2Click(Sender: TObject);
begin
 Fac_Edit.Text:= '';
 ID_FACULTY:= -1;
end;

procedure TfrmFilterPrint.FormShow(Sender: TObject);
begin
  ID_PRICE := -1;
  ID_FACULTY:= -1;
end;

procedure TfrmFilterPrint.Action1Execute(Sender: TObject);
begin
if designer_rep=0 then
  begin
    designer_rep:=1;
    Label1.Caption :='Режим отладки отчетов';
  end
  else
  begin
    designer_rep:=0;
    Label1.Caption:='';
  end;
end;

procedure TfrmFilterPrint.FormCreate(Sender: TObject);
begin
  designer_rep:=0;
end;

procedure TfrmFilterPrint.btnOkClick(Sender: TObject);
var
    AParameter:TcnSimpleParams;
    FieldView:Variant;
    VieRx :TcnView;
begin
  Screen.Cursor := crHourGlass;
  pReadDataSet.SelectSQL.Clear;
  pReadDataSet.SelectSQL.Text := 'select * from CN_PRICES_PRINT (' + IntToStr(ID_PRICE) + ',' + IntToStr(ID_FACULTY)+ ',' + IntToStr(isPreyskPrint)+') order by NAME_PRICE, NAME_FACULTY, NAME_SPECIALITY, NAME_NATIONALITY, NAME_FORM_STUDY, NAME_KATEGORY,ID_KURS';

  pReadDataSet.Open;
  pReadDataSet.FetchAll;

  frxReport.Clear;
  if Bool(isPreyskPrint) then
   frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Contracts\'+'TestPrices'+'.fr3')
  else
   frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Contracts\'+'TestPricesFinances'+'.fr3');
  frxReport.Variables.Clear;

  frxReport.PrepareReport(true);
  frxReport.ShowReport;
  Screen.Cursor := crDefault;
  if designer_rep=1 then
    begin
      frxReport.DesignReport;
    end;
  pReadDataSet.Close;
end;

end.
