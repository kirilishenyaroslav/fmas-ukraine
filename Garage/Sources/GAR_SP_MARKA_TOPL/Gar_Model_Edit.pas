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
    Actions: TActionList;
    ActionYes: TAction;
    ActionCancel: TAction;
    ActionAdd: TAction;
    ActionDel: TAction;
    ActionClean: TAction;
    ActionList1: TActionList;
    Action1: TAction;
    GroupBoxProp: TcxGroupBox;
    cxLookupComboBox1: TcxLookupComboBox;
    cxGroupBox1: TcxGroupBox;
    cxTextEdit1: TcxTextEdit;
    procedure Action1Execute(Sender: TObject);
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
  if Param.fs=zcfsDelete then FEditModel.delete(Param)
  else  FEditModel.PrepareData(Param);
  if Param.fs<>zcfsDelete then
  FEditModel.ShowModal;
  FEditModel.Free;
  Result:=Param.Id_Model;
end;

function TFEditModel.PrepareData(Param:TgarParamModel):variant;
begin
  pFIBDataSet1.Transaction.StartTransaction;
  pFIBDataSet1.Close;
  case Param.fs of
    zcfsInsert:
      try
        pFIBDataSet1.SQLs.SelectSQL.Text:='SELECT * FROM GAR_SP_MARKA_S';
        pFIBDataSet1.Open;
        cxLookupComboBox1.EditValue:=0;
      except

      end;
    zcfsUpdate:
      try
        pFIBDataSet1.SQLs.SelectSQL.Text:='SELECT * FROM GAR_SP_MARKA_S';
        pFIBDataSet1.Open;
        pFIBDataSet1.Locate('NAME_MARKA',Param.NameMarka,[loCaseInsensitive]);
        cxLookupComboBox1.EditValue:=pFIBDataSet1['ID_MARKA'];
        cxTextEdit1.EditValue:=Param.NameModel;

      except
      
      end;
  end;

end;

procedure TFEditModel.Action1Execute(Sender: TObject);
begin

  if cxLookupComboBox1.EditValue=Null then
    begin
      showmessage('Поле марки не заполнено!');
      exit;
    end;

  if cxTextEdit1.EditValue='' then
    begin
      showmessage('Поле модели не заполнено!');
      exit;
    end;

  with DM do
  try
    pFIBStoredProc1.Transaction.StartTransaction;
    case ParamLoc.fs of
      zcfsInsert: pFIBStoredProc1.StoredProcName:='GAR_SP_MODEL_I';
      zcfsUpdate: pFIBStoredProc1.StoredProcName:='GAR_SP_MODEL_U';
    end;
    pFIBStoredProc1.Prepare;
    pFIBStoredProc1.ParamByName('ID_MARKA').AsVariant  := cxLookupComboBox1.EditValue;
    pFIBStoredProc1.ParamByName('NAME_MODEL').AsVariant           := cxTextEdit1.EditValue;

    case ParamLoc.fs of
     zcfsUpdate:
       pFIBStoredProc1.ParamByName('ID_MODEL').AsInt64   := ParamLoc.Id_Model;
    end;

    pFIBStoredProc1.ExecProc;
    if ParamLoc.fs=zcfsInsert then ParamLoc.Id_Model:=pFIBStoredProc1.ParamByName('ID_MODEL').AsInt64;
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

end.
