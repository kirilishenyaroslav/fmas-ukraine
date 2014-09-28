unit Gar_Avto_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, cxMaskEdit,
  cxDropDownEdit, cxDBEdit, DB, FIBDataSet, pFIBDataSet, StdCtrls,
  cxButtons, cxControls, cxContainer, cxEdit, cxTextEdit, gar_Types, zTypes,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, ActnList, gr_uMessage, gr_uCommonConsts,
  gr_uCommonProc, cxGroupBox, gar_Avto_DM, cxCheckBox;
type
  TFEditAvto = class(TForm)
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
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
    cxGroupBox2: TcxGroupBox;
    cxLookupComboBox2: TcxLookupComboBox;
    cxGroupBox3: TcxGroupBox;
    cxTextEdit2: TcxTextEdit;
    cxGroupBox4: TcxGroupBox;
    cxTextEdit3: TcxTextEdit;
    cxGroupBox5: TcxGroupBox;
    cxTextEdit4: TcxTextEdit;
    pFIBDataSet1: TpFIBDataSet;
    DataSource1: TDataSource;
    pFIBDataSet2: TpFIBDataSet;
    DataSource2: TDataSource;
    cxCheckBox1: TcxCheckBox;
    Action2: TAction;
    cxCheckBox2: TcxCheckBox;
    Action3: TAction;
    procedure Action1Execute(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
  private
    PLanguageIndex:integer;
    ParamLoc:TgarParamAvto;
  public
    constructor Create(Param:TgarParamAvto);reintroduce;
    function Delete(Param:TgarParamAvto):variant;
    function PrepareData(Param:TgarParamAvto):variant;
  end;

function View_FEdit(Param:TgarParamAvto):variant;

var
  FEditAvto: TFEditAvto;

implementation

{$R *.dfm}
constructor TFEditAvto.Create(Param:TgarParamAvto);
begin
  inherited Create(Param.owner);
  PLanguageIndex:=IndexLanguage;
  ParamLoc:=Param;
  pFIBDataSet1.Database:=DM.DB;
  pFIBDataSet1.Transaction:=DM.RTransaction;
  DataSource1.DataSet:=pFIBDataSet1;

  pFIBDataSet2.Database:=DM.DB;
  pFIBDataSet2.Transaction:=DM.RTransaction;
  DataSource2.DataSet:=pFIBDataSet2;

  cxLookupComboBox1.Properties.DataController.DataSource:=DataSource1;
  cxLookupComboBox1.Properties.KeyFieldNames  :='ID_MODEL';
  cxLookupComboBox1.Properties.ListFieldNames :='NAME_MODEL_MARKA';
  cxLookupComboBox2.Properties.DataController.DataSource:=DataSource2;
  cxLookupComboBox2.Properties.KeyFieldNames  :='ID_MARKA_TOPL';
  cxLookupComboBox2.Properties.ListFieldNames :='NAME_MARKA_TOPL';
end;

function TFEditAvto.Delete(Param:TgarParamAvto):variant;
begin
  DM.pFIBStoredProc1.StoredProcName:='GAR_SP_AVTO_D';
  DM.pFIBStoredProc1.Transaction.StartTransaction;
  DM.pFIBStoredProc1.Prepare;
  DM.pFIBStoredProc1.ParamByName('ID_AVTO').AsInteger:= Param.ID_AVTO;
  DM.pFIBStoredProc1.ExecProc;
  DM.pFIBStoredProc1.Transaction.Commit;
end;

function View_FEdit(Param:TgarParamAvto):variant;
begin
  FEditAvto:=TFEditAvto.Create(Param);
  if Param.fs=garfsDelete then FEditAvto.delete(Param)
  else  FEditAvto.PrepareData(Param);
  if Param.fs<>garfsDelete then
  FEditAvto.ShowModal;
  FEditAvto.Free;
  Result:=Param.ID_AVTO;
end;

function TFEditAvto.PrepareData(Param:TgarParamAvto):variant;
begin
  pFIBDataSet1.Transaction.StartTransaction;
  pFIBDataSet1.Close;
  case Param.fs of
    garfsInsert:
      try
        pFIBDataSet1.SQLs.SelectSQL.Text:='SELECT * FROM GAR_SP_MODEL_S';
        pFIBDataSet1.Open;
        cxLookupComboBox1.EditValue:=0;

        pFIBDataSet2.SQLs.SelectSQL.Text:='SELECT * FROM GAR_SP_MARKA_TOPL_S';
        pFIBDataSet2.Open;
        cxLookupComboBox2.EditValue:=0;
      except

      end;


    garfsUpdate:
      try
        pFIBDataSet1.SQLs.SelectSQL.Text:='SELECT * FROM GAR_SP_MODEL_S';
        pFIBDataSet1.Open;
        pFIBDataSet1.Locate('NAME_MODEL',Param.NAME_MODEL,[loCaseInsensitive]);
        cxLookupComboBox1.EditValue:=pFIBDataSet1['id_MODEL'];

        pFIBDataSet2.SQLs.SelectSQL.Text:='SELECT * FROM GAR_SP_MARKA_TOPL_S';
        pFIBDataSet2.Open;
        pFIBDataSet2.Locate('NAME_MARKA_TOPL', Param.NAME_MARKA_TOPL, [loCaseInsensitive]);
        cxLookupComboBox2.EditValue:=pFIBDataSet2['id_MARKA_TOPL'];

        cxTextEdit1.EditValue:=Param.NAME;
        cxTextEdit2.EditValue:=Param.NOM_GOS;
        cxTextEdit3.EditValue:=Param.NOM_MOTOR;
        if Param.CALC_METOD=1 then cxCheckBox2.Checked:=True
        else cxCheckBox2.Checked:=False;

        cxTextEdit4.EditValue:=Param.NOM_KUZ;

      except
      
      end;
  end;

end;

procedure TFEditAvto.Action1Execute(Sender: TObject);
begin

  if (VarToStr(cxTextEdit1.EditValue)='') and (not cxCheckBox1.Checked) then
    begin
      showmessage('Поле "Наименование" не заполнено!');
      exit;
    end;

  if (cxLookupComboBox1.EditValue=Null) or (cxLookupComboBox1.text='') then
    begin
      showmessage('Поле "Модель" не заполнено!');
      exit;
    end;

  if VarToStr(cxTextEdit2.EditValue)='' then
    begin
      showmessage('Поле "Гос номер" не заполнено!');
      exit;
    end;

  if VarToStr(cxTextEdit3.EditValue)='' then
    begin
      showmessage('Поле "Номер мотора" не заполнено!');
      exit;
    end;

  if VarToStr(cxTextEdit4.EditValue)='' then
    begin
      showmessage('Поле "Номер кузова" не заполнено!');
      exit;
    end;

  if (cxLookupComboBox2.EditValue=Null) or (cxLookupComboBox2.text='') then
    begin
      showmessage('Поле "Марка топлива" не заполнено!');
      exit;
    end;



  with DM do
  try
    pFIBStoredProc1.Transaction.StartTransaction;
    case ParamLoc.fs of
      garfsInsert: pFIBStoredProc1.StoredProcName:='GAR_SP_AVTO_I';
      garfsUpdate: pFIBStoredProc1.StoredProcName:='GAR_SP_AVTO_U';
    end;
    pFIBStoredProc1.Prepare;

    if  cxCheckBox1.Checked then
      pFIBStoredProc1.ParamByName('NAME').AsVariant :='def'
    else
      pFIBStoredProc1.ParamByName('NAME').AsVariant := cxTextEdit1.EditValue;

    pFIBStoredProc1.ParamByName('ID_MODEL').AsInteger       := cxLookupComboBox1.EditValue;
    pFIBStoredProc1.ParamByName('NOM_GOS').AsString        := cxTextEdit2.EditValue;
    pFIBStoredProc1.ParamByName('NOM_MOTOR').AsString      := cxTextEdit3.EditValue;
    if cxCheckBox2.Checked then pFIBStoredProc1.ParamByName('CALC_METOD').AsInteger      := 1
    else pFIBStoredProc1.ParamByName('CALC_METOD').AsInteger      := 0;
    pFIBStoredProc1.ParamByName('NOM_KUZ').AsString        := cxTextEdit4.EditValue;
    pFIBStoredProc1.ParamByName('ID_MARKA_TOPL').AsInteger  := cxLookupComboBox2.EditValue;


    case ParamLoc.fs of
     garfsUpdate:
       pFIBStoredProc1.ParamByName('ID_AVTO').AsInt64   := ParamLoc.ID_AVTO;
    end;

    pFIBStoredProc1.ExecProc;
    if ParamLoc.fs=garfsInsert then ParamLoc.ID_AVTO:=pFIBStoredProc1.ParamByName('ID_AVTO').AsInt64;
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

procedure TFEditAvto.cxCheckBox1PropertiesChange(Sender: TObject);
begin
  cxTextEdit1.Enabled:=not cxTextEdit1.Enabled;
end;

procedure TFEditAvto.cxButton2Click(Sender: TObject);
begin
 Modalresult:=mrCancel;
end;

procedure TFEditAvto.Action2Execute(Sender: TObject);
begin
      if  cxButton1.Focused Then Action1Execute(Sender);
      if  cxButton2.Focused Then cxButton2Click(Sender);
      SendKeyDown(Self.ActiveControl,VK_TAB,[]);
end;

end.
