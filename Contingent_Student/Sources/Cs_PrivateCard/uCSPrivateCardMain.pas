unit uCSPrivateCardMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDataSet, pFIBDataSet, StdCtrls,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxControls, cxGridCustomView, cxGrid, ExtCtrls, cxButtons, cxCheckBox,
  cxDropDownEdit, cxTextEdit, cxLabel, cxClasses, ActnList, cxContainer,
  cxMaskEdit, cxCalendar, ComCtrls, ucs_types;

type
  TfmStudPrivateCard = class(TForm)
    PageControl: TPageControl;
    FirstPage: TTabSheet;
    DateBirthEdit: TcxDateEdit;
    PasportInfo: TTabSheet;
    Actions: TActionList;
    ActionYes: TAction;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    OrdersInfo: TTabSheet;
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    TextEditINN: TcxTextEdit;
    TextEditFIO: TcxTextEdit;
    CheckBoxRezident: TcxCheckBox;
    cxButton1: TcxButton;
    Panel2: TPanel;
    ActualPaspCB: TcxCheckBox;
    PasportGrid: TcxGrid;
    PasportGridDBTableView1: TcxGridDBTableView;
    cmnFIO: TcxGridDBColumn;
    cmnSERIA: TcxGridDBColumn;
    cmnNUMBER: TcxGridDBColumn;
    cmnDATE_BEG: TcxGridDBColumn;
    cmnDATE_END: TcxGridDBColumn;
    PasportGridLevel1: TcxGridLevel;
    Label12: TLabel;
    VidanDBText: TcxTextEdit;
    Panel1: TPanel;
    TextEditSex: TcxTextEdit;
    cxGrid1: TcxGrid;
    OrdersTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    ActionClose: TAction;
    procedure ActualPaspCBClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure TextEditFIOKeyPress(Sender: TObject; var Key: Char);
    procedure ActionCloseExecute(Sender: TObject);
  private
    IdMan, IdPersonEducation : integer;
  public
    res:Variant;
     procedure LoadPassData;
     procedure LoadMainInfo;
     procedure LoadOrders;
    constructor  Create(AParameter:TcsParamPacks);reintroduce;
  end;

{var
  fmStudPrivateCard: TfmStudPrivateCard;    }

implementation

uses DM_PrivateCard;

{$R *.dfm}
constructor TfmStudPrivateCard.Create(AParameter:TcsParamPacks);
begin
  Screen.Cursor := crHourGlass;

  inherited Create(AParameter.Owner);

  DM := TDM.Create(Self);
  DM.DB.Handle:=AParameter.DB_Handle;
  DM.DB.Connected    := True;
  IdMan             := Aparameter.ID_Locate;
  IdPersonEducation := Aparameter.ID_Locate_1;

  PageControl.ActivePage := FirstPage;


  PasportGridDBTableView1.DataController.DataSource      := DM.PassDataSourse;
  OrdersTableView1.DataController.DataSource             := DM.DataSourceOrders;
  //DBLabelFak.DataBinding.DataSource                 := DM.DataSourceStud;
 // DBLabelGroup.DataBinding.DataSource               := DM.DataSourceStud;
 // DBLabelFormEduc.DataBinding.DataSource            := DM.DataSourceStud;
  LoadPassData;
  LoadMainInfo;
  LoadOrders;

  Screen.Cursor:=crDefault;
end;

procedure TfmStudPrivateCard.LoadPassData;
var
    pIdPasData: Int64;
begin
    pIdPasData := -1;

    if DM.DSPassData.Active then
    begin
        if not DM.DSPassData.IsEmpty then
            pIdPasData := DM.DSPassData['ID_PAS_DATA'];
        DM.DSPassData.Close;
    end;
    if ActualPaspCB.Checked then
        DM.DSPassData.SQLs.SelectSQL.Text := 'SELECT * FROM PASS_DATA_GET_BY_ID_MAN('
            + IntToStr(IdMan) + ',''T'')'
    else
        DM.DSPassData.SQLs.SelectSQL.Text := 'SELECT * FROM PASS_DATA_GET_BY_ID_MAN('
            + IntToStr(IdMan) + ',''F'')';

    DM.DSPassData.Open;
    if VarIsNull(DM.DSPassData['VIDAN']) then
        VidanDBText.Text := ''
    else
        VidanDBText.Text := DM.DSPassData['VIDAN'];

    DM.DSPassData.Locate('ID_PAS_DATA', pIdPasData, []);
end;

procedure TfmStudPrivateCard.LoadMainInfo;
begin
    DM.DataSetPeople.Close;
    DM.DataSetPeople.SQLs.SelectSQL.Text := 'SELECT first(1)p.FAMILIA,p.IMYA,p.OTCHESTVO,p.BIRTH_DATE, p.TIN,  i.short_name, p.id_country, case when p.id_country<>1 or p.id_country is null  then 0  else 1 end from people p left join ini_sex i on i.id_sex=p.id_sex where id_man='+ IntToStr(IdMan)+' order by p.FAMILIA,p.IMYA,p.OTCHESTVO';
    DM.DataSetPeople.Open;
    if(DM.DataSetPeople['OTCHESTVO']<>null) then
         TextEditFIO.Text := DM.DataSetPeople['FAMILIA']+' '+DM.DataSetPeople['IMYA']+' '+DM.DataSetPeople['OTCHESTVO']
    else
         TextEditFIO.Text := DM.DataSetPeople['FAMILIA']+' '+DM.DataSetPeople['IMYA'];
    if(DM.DataSetPeople['TIN']<>null) then
        TextEditINN.Text := DM.DataSetPeople['TIN'];
    if(DM.DataSetPeople['BIRTH_DATE']<>null) then
        DateBirthEdit.Date := DM.DataSetPeople['BIRTH_DATE'];
    if(DM.DataSetPeople['SHORT_NAME']<>null) then
        TextEditSex.Text := DM.DataSetPeople['SHORT_NAME'];
    if(DM.DataSetPeople['id_country']=1) then
        CheckBoxRezident.Checked := true
    else
        CheckBoxRezident.Checked := false;
end;

procedure TfmStudPrivateCard.ActualPaspCBClick(Sender: TObject);
begin
     LoadPassData;
end;

procedure TfmStudPrivateCard.LoadOrders;
begin
    DM.DataSetOrders.Close;
    DM.DataSetOrders.SQLs.SelectSQL.Text := 'SELECT c.NUM_ORDER, c.DATE_ORDER, (case when s.id_order_edbo = 0 or s.id_order_edbo = null then ''Невизначений наказ'' else t.TYPE_NAME end) as TYPE_NAME'+
    ' from CS_DT_STUD s left join CS_ORDERS c on s.id_order=c.id_order  left join CS_DT_ORDER_TYPE t on t.number_from_edbo=c.id_order_type where s.ID_PERSON_EDUCATION='+ IntToStr(IdPersonEducation);
    DM.DataSetOrders.Open;
end;

procedure TfmStudPrivateCard.cxButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfmStudPrivateCard.TextEditFIOKeyPress(Sender: TObject;
  var Key: Char);
begin
    key := chr(0);
end;

procedure TfmStudPrivateCard.ActionCloseExecute(Sender: TObject);
begin
  close;
end;

end.
