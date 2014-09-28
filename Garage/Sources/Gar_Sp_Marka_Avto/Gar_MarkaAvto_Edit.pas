unit Gar_MarkaAvto_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, gar_MarkaAvto_DM, cxLookAndFeelPainters, cxMaskEdit,
  cxDropDownEdit, cxDBEdit, DB, FIBDataSet, pFIBDataSet, StdCtrls,
  cxButtons, cxControls, cxContainer, cxEdit, cxTextEdit, gar_Types, zTypes,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, ActnList, gr_uMessage, gr_uCommonConsts,
  gr_uCommonProc, cxGroupBox;
type
  TFEditMarka = class(TForm)
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
    Action2: TAction;
    Action3: TAction;
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    PLanguageIndex:integer;
    ParamLoc:TgarParamMarkaAvto;
  public
    constructor Create(Param:TgarParamMarkaAvto);reintroduce;
    function Delete(Param:TgarParamMarkaAvto):variant;
    function PrepareData(Param:TgarParamMarkaAvto):variant;
  end;

function View_FEdit(Param:TgarParamMarkaAvto):variant;

var
  FEditMarka: TFEditMarka;


implementation

{$R *.dfm}
constructor TFEditMarka.Create(Param:TgarParamMarkaAvto);
begin
  inherited Create(Param.owner);
  PLanguageIndex:=IndexLanguage;
  ParamLoc:=Param;
  pFIBDataSet1.Database:=DM_Marka_Avto.DB;
  pFIBDataSet1.Transaction:=DM_Marka_Avto.RTransaction;
  DataSource1.DataSet:=pFIBDataSet1;
  cxLookupComboBox1.Properties.DataController.DataSource:=DataSource1;
  cxLookupComboBox1.Properties.KeyFieldNames  :='ID_COUNTRY';
  cxLookupComboBox1.Properties.ListFieldNames :='NAME_COUNTRY';
end;

function TFEditMarka.Delete(Param:TgarParamMarkaAvto):variant;
begin
  DM_Marka_Avto.pFIBStoredProc1.StoredProcName:='GAR_SP_MARKA_D';
  DM_Marka_Avto.pFIBStoredProc1.Transaction.StartTransaction;
  DM_Marka_Avto.pFIBStoredProc1.Prepare;
  DM_Marka_Avto.pFIBStoredProc1.ParamByName('ID_MARKA').AsInt64:= Param.Id_Marka;
  DM_Marka_Avto.pFIBStoredProc1.ExecProc;
  DM_Marka_Avto.pFIBStoredProc1.Transaction.Commit;
end;

function View_FEdit(Param:TgarParamMarkaAvto):variant;
begin
  FEditMarka:=TFEditMarka.Create(Param);
  if Param.fs=garfsDelete then FEditMarka.delete(Param)
  else  FEditMarka.PrepareData(Param);
  if Param.fs<>garfsDelete then
  FEditMarka.ShowModal;
  FEditMarka.Free;
  Result:=Param.Id_Marka;
end;

function TFEditMarka.PrepareData(Param:TgarParamMarkaAvto):variant;
begin
  pFIBDataSet1.Transaction.StartTransaction;
  pFIBDataSet1.Close;
  case Param.fs of
    garfsInsert:
      try
        pFIBDataSet1.SQLs.SelectSQL.Text:='SELECT * FROM ADR_COUNTRY_SELECT';
        pFIBDataSet1.Open;
        cxLookupComboBox1.EditValue:=0;
      except

      end;
    garfsUpdate:
      try
        pFIBDataSet1.SQLs.SelectSQL.Text:='SELECT * FROM ADR_COUNTRY_SELECT';
        pFIBDataSet1.Open;
        pFIBDataSet1.Locate('NAME_COUNTRY',Param.Country_Provider,[loCaseInsensitive]);
        cxLookupComboBox1.EditValue:=pFIBDataSet1['ID_COUNTRY'];
        cxTextEdit1.EditValue:=Param.NameMarka;

      except
      
      end;
  end;

end;

procedure TFEditMarka.Action1Execute(Sender: TObject);
begin

  if (cxLookupComboBox1.EditText='') or (cxLookupComboBox1.EditValue=0) then
    begin
      showmessage('Поле страны-производителя не заполнено!');
      exit;
    end;

  if cxTextEdit1.EditingText='' then
    begin
      showmessage('Поле марки не заполнено!');
      exit;
    end;

  with DM_Marka_Avto do
  try
    pFIBStoredProc1.Transaction.StartTransaction;
    case ParamLoc.fs of
      garfsInsert: pFIBStoredProc1.StoredProcName:='GAR_SP_MARKA_I';
      garfsUpdate: pFIBStoredProc1.StoredProcName:='GAR_SP_MARKA_U';
    end;
    pFIBStoredProc1.Prepare;
    pFIBStoredProc1.ParamByName('ID_COUNTRY_PROVIDER').AsVariant  := cxLookupComboBox1.EditValue;
    pFIBStoredProc1.ParamByName('NAME_MARKA').AsVariant           := cxTextEdit1.EditValue;

    case ParamLoc.fs of
     garfsUpdate:
       pFIBStoredProc1.ParamByName('ID_MARKA').AsInt64   := ParamLoc.Id_Marka;
    end;

    pFIBStoredProc1.ExecProc;
    if ParamLoc.fs=garfsInsert then ParamLoc.Id_Marka:=pFIBStoredProc1.ParamByName('ID_MARKA').AsInt64;
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

procedure TFEditMarka.Action2Execute(Sender: TObject);
begin
      if  cxButton1.Focused Then Action1Execute(Sender);
      if  cxButton2.Focused Then cxButton2Click(Sender);
      SendKeyDown(Self.ActiveControl,VK_TAB,[]);
end;

procedure TFEditMarka.cxButton2Click(Sender: TObject);
begin
 ModalResult:=mrCancel;
end;

end.
