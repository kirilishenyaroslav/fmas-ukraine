unit Gar_Model_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, gar_DM, cxLookAndFeelPainters, cxMaskEdit,
  cxDropDownEdit, cxDBEdit, DB, FIBDataSet, pFIBDataSet, StdCtrls,
  cxButtons, cxControls, cxContainer, cxEdit, cxTextEdit, gar_Types, zTypes,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, ActnList, gr_uMessage, gr_uCommonConsts,
  gr_uCommonProc, cxGroupBox;
type
  TFEditModel = class(TForm)
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    pFIBDataSet1: TpFIBDataSet;
    DataSource1: TDataSource;
    ActionList1: TActionList;
    Action1: TAction;
    GroupBoxProp: TcxGroupBox;
    cxLookupComboBox1: TcxLookupComboBox;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    cxMaskEdit1: TcxMaskEdit;
    cxMaskEdit2: TcxMaskEdit;
    Action2: TAction;
    cxGroupBox3: TcxGroupBox;
    cxMaskEdit3: TcxMaskEdit;
    Action3: TAction;
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    PLanguageIndex:integer;
    ParamLoc:TgarParamModel;
  public
    constructor Create(Param:TgarParamModel);reintroduce;
    function Delete(Param:TgarParamModel):variant;
    function PrepareData(Param:TgarParamModel):variant;
  end;

function View_FEdit(Param:TgarParamModel):variant;

var
  FEditModel: TFEditModel;

implementation

{$R *.dfm}
constructor TFEditModel.Create(Param:TgarParamModel);
begin
  inherited Create(Param.owner);
  PLanguageIndex:=IndexLanguage;
  ParamLoc:=Param;
  pFIBDataSet1.Database:=DM.DB;
  pFIBDataSet1.Transaction:=DM.RTransaction;
  DataSource1.DataSet:=pFIBDataSet1;
  cxLookupComboBox1.Properties.DataController.DataSource:=DataSource1;
  cxLookupComboBox1.Properties.KeyFieldNames  :='ID_MARKA';
  cxLookupComboBox1.Properties.ListFieldNames :='NAME_MARKA';
end;

function TFEditModel.Delete(Param:TgarParamModel):variant;
begin
  DM.pFIBStoredProc1.StoredProcName:='GAR_SP_MODEL_D';
  DM.pFIBStoredProc1.Transaction.StartTransaction;
  DM.pFIBStoredProc1.Prepare;
  DM.pFIBStoredProc1.ParamByName('ID_MODEL').AsInteger:= Param.Id_Model;
  DM.pFIBStoredProc1.ExecProc;
  DM.pFIBStoredProc1.Transaction.Commit;
end;

function View_FEdit(Param:TgarParamModel):variant;
begin
  FEditModel:=TFEditModel.Create(Param);
  if Param.fs=garfsDelete then FEditModel.delete(Param)
  else  FEditModel.PrepareData(Param);
  if Param.fs<>garfsDelete then
  FEditModel.ShowModal;
  FEditModel.Free;
  Result:=Param.Id_Model;
end;

function TFEditModel.PrepareData(Param:TgarParamModel):variant;
begin
  pFIBDataSet1.Transaction.StartTransaction;
  pFIBDataSet1.Close;
  case Param.fs of
    garfsInsert:
      try
        pFIBDataSet1.Close;
        pFIBDataSet1.SQLs.SelectSQL.Text:='SELECT * FROM GAR_SP_MARKA_S';
        pFIBDataSet1.Open;
        cxLookupComboBox1.EditValue:=0;
      except

      end;
    garfsUpdate:
      try
        pFIBDataSet1.SQLs.SelectSQL.Text:='SELECT * FROM GAR_SP_MARKA_S';
        pFIBDataSet1.Open;
        pFIBDataSet1.Locate('Id_Marka',Param.Id_Marka,[loCaseInsensitive]);
        cxLookupComboBox1.EditValue:=pFIBDataSet1['ID_MARKA'];
        cxMaskEdit1.EditValue:=Param.NameModel;
        cxMaskEdit2.EditValue:=Param.CONSUPTION_BASE;
        cxMaskEdit3.EditValue:=Param.CONSUPTION_BASE_TIME;
      except
      
      end;
  end;

end;

procedure TFEditModel.Action1Execute(Sender: TObject);
begin

  if (cxLookupComboBox1.EditValue=Null) or (cxLookupComboBox1.EditValue=0)then
    begin
      showmessage('Поле марки не заполнено!');
      exit;
    end;

  if (cxMaskEdit1.TEXT='') then
    begin
      showmessage('Поле модели не заполнено!');
      exit;
    end;

  if (cxMaskEdit2.TEXT='') then
    begin
      showmessage('Поле расхода на 100 км не заполнено!');
      exit;
    end;

  if (cxMaskEdit3.TEXT='') then
    begin
      showmessage('Поле расхода в 1 час не заполнено!');
      exit;
    end;

  with DM do
  try
    pFIBStoredProc1.Transaction.StartTransaction;
    case ParamLoc.fs of
      garfsInsert: pFIBStoredProc1.StoredProcName:='GAR_SP_MODEL_I';
      garfsUpdate: pFIBStoredProc1.StoredProcName:='GAR_SP_MODEL_U';
    end;
    pFIBStoredProc1.Prepare;
    pFIBStoredProc1.ParamByName('ID_MARKA').AsVariant  := cxLookupComboBox1.EditValue;
    pFIBStoredProc1.ParamByName('NAME_MODEL').AsVariant           := cxMaskEdit1.EditValue;
    pFIBStoredProc1.ParamByName('CONSUPTION_BASE').AsVariant      := cxMaskEdit2.EditValue;
    pFIBStoredProc1.ParamByName('CONSUPTION_BASE_TIME').AsVariant := cxMaskEdit3.EditValue;

    case ParamLoc.fs of
     garfsUpdate:
       pFIBStoredProc1.ParamByName('ID_MODEL').AsInt64   := ParamLoc.Id_Model;
    end;

    pFIBStoredProc1.ExecProc;
    if ParamLoc.fs=garfsInsert then ParamLoc.Id_Model:=pFIBStoredProc1.ParamByName('ID_MODEL').AsInt64;
    pFIBStoredProc1.Transaction.Commit;
  except
    on e:Exception do
      begin
        grShowMessage(ECaption[PLanguageIndex],e.message,mtError,[mbOk]);
        pFIBStoredProc1.Transaction.RollBack;
      end;
  end;
  
  ModalResult:=mrYes;
end;

procedure TFEditModel.Action2Execute(Sender: TObject);
begin
      if  cxButton1.Focused Then Action1Execute(Sender);
      if  cxButton2.Focused Then cxButton2Click(Sender);
      SendKeyDown(Self.ActiveControl,VK_TAB,[]);
end;

procedure TFEditModel.cxButton2Click(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

end.
