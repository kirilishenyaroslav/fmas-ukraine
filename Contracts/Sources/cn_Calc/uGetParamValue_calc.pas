unit UGetParamValue_Calc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxTextEdit, FIBDataSet, pFIBDataSet, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, FIBDatabase, pFibDataBase, ActnList,
  cn_common_funcs, cnConsts, iBase, DM_Calc;

type
  TParamFilterValues=array of int64;
  TParamTextFilterValues=array of string;

  TfrmGetParamValue_calc = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ok_button: TcxButton;
    cancel_button: TcxButton;
    cxStyleRepository1: TcxStyleRepository;
    back: TcxStyle;
    column_gray: TcxStyle;
    periods: TcxStyle;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    backbold: TcxStyle;
    PriceGridInfo: TcxGrid;
    FacultyView: TcxGridDBTableView;
    name_table: TcxGridDBColumn;
    PriceGridInfoDBTableView1: TcxGridDBTableView;
    SpecialityView: TcxGridDBTableView;
    PriceGridInfoLevel1: TcxGridLevel;
    ParamsDataSet: TpFIBDataSet;
    ParamsDataSource: TDataSource;
    ActionList1: TActionList;
    Ok_act: TAction;
    Cancel_act: TAction;
    procedure Ok_actExecute(Sender: TObject);
    procedure Cancel_actExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FacultyViewDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    DM:TDM_Calc;
  public
    { Public declarations }
    ResultId:Integer;
    ResultText:String;
    ParamType:Smallint;
    PLanguageIndex:byte;
    constructor Create(AOwner:TComponent;
                       ParamType:Smallint;
                       FilterValues:TParamFilterValues;
                       Db_handle:TISC_DB_HANDLE);
  end;

implementation

{$R *.dfm}

constructor TfrmGetParamValue_calc.Create(AOwner:TComponent;
                                     ParamType:Smallint;
                                     FilterValues:TParamFilterValues;
                                     Db_Handle:TISC_DB_HANDLE);
begin
  inherited Create(AOwner);
  DM:=TDM_Calc.Create(aOwner);
  DM.DB.Handle:=Db_handle;
  DM.DB.Connected;
  DM.ReadTransaction.StartTransaction;
  ParamsDataSet.Database:=Dm.DB;
  Self.ParamType:=ParamType;

  if (ParamType=0) then
   begin
    ParamsDataSet.SelectSQL.Text:='select NAME, ID_FACUL from CN_SP_FACUL ';
    ParamsDataSet.SelectSQL.Text:=ParamsDataSet.SelectSQL.text+ ' ORDER BY NAME'
   end;

  if (ParamType=1)
   then
    begin
     ParamsDataSet.SelectSQL.Text:='select distinct * from CN_SP_SPEC S, CN_JN_FACUL_SPEC JS where IS_DELETED=0 AND S.ID_SPEC=JS.ID_SPEC';
     if FilterValues[0]<>-1 then ParamsDataSet.SelectSQL.text:= ParamsDataSet.SelectSQL.text+ ' and JS.ID_FACUL='+IntToStr(FilterValues[0]);
     ParamsDataSet.SelectSQL.text:= ParamsDataSet.SelectSQL.text+ ' ORDER BY NAME';
    end;

  if (ParamType=2)
   then
   begin
    ParamsDataSet.SelectSQL.Text:='select * from CN_SP_FORM_STUD';
    ParamsDataSet.SelectSQL.Text:=ParamsDataSet.SelectSQL.text+ ' ORDER BY NAME'
   end;

  if (ParamType=3)
   then
    begin
     ParamsDataSet.SelectSQL.Text:='select * from CN_SP_NATIONAL';
     ParamsDataSet.SelectSQL.Text:=ParamsDataSet.SelectSQL.text+ ' ORDER BY NAME'
    end;

  if (ParamType=4)
   then
    begin
     ParamsDataSet.SelectSQL.Text:='select * from CN_SP_KAT_STUD';
     ParamsDataSet.SelectSQL.Text:=ParamsDataSet.SelectSQL.text+ ' ORDER BY NAME'
    end;

  if (ParamType=5)
   then
    begin
     ParamsDataSet.SelectSQL.Text:='select * from CN_GET_CURS';
    end;

  ParamsDataSet.Open;
end;

procedure TfrmGetParamValue_calc.Ok_actExecute(Sender: TObject);
begin
  if (ParamsDataSet.RecordCount>0)
   then
    begin
     if (ParamType=0)
      then
       begin
        ResultId  :=ParamsDataSet.FieldByName('ID_FACUL').Value;
        ResultText:=ParamsDataSet.FieldByName('NAME').AsString;
       end;
     if (ParamType=1)
      then
       begin
        ResultId  :=ParamsDataSet.FieldByName('ID_SPEC').Value;
        ResultText:=ParamsDataSet.FieldByName('NAME').AsString;
       end;
     if (ParamType=2)
      then
       begin
        ResultId  :=ParamsDataSet.FieldByName('ID_FORM_STUD').Value;
        ResultText:=ParamsDataSet.FieldByName('NAME').AsString;
       end;
     if (ParamType=3)
      then
       begin
        ResultId  :=ParamsDataSet.FieldByName('ID_NATIONAL').Value;
        ResultText:=ParamsDataSet.FieldByName('NAME').AsString;
       end;
     if (ParamType=4)
      then
       begin
        ResultId  :=ParamsDataSet.FieldByName('ID_KAT_STUD').Value;
        ResultText:=ParamsDataSet.FieldByName('NAME').AsString;
       end;
     if (ParamType=5)
      then
       begin
        ResultId  :=ParamsDataSet.FieldByName('CURS').Value;
        ResultText:=ParamsDataSet.FieldByName('CURS').AsString;
       end;
    end;
  ModalResult:=mrOk;
end;

procedure TfrmGetParamValue_calc.Cancel_actExecute(Sender: TObject);
begin
  DM.Free;
  Close;
end;

procedure TfrmGetParamValue_calc.FormCreate(Sender: TObject);
begin
  PLanguageIndex        :=cn_Common_Funcs.cnLanguageIndex();
  caption               := cn_StudyParams_Title[PLanguageIndex];
  name_table.Caption    := cn_Name_Column[PLanguageIndex];
  ok_button.Caption     := cn_Accept[PLanguageIndex];
  ok_button.Hint        := cn_Accept[PLanguageIndex];
  cancel_button.Caption := cn_Cancel[PLanguageIndex];
  cancel_button.Hint    := cn_Cancel[PLanguageIndex];
end;

procedure TfrmGetParamValue_calc.FacultyViewDblClick(Sender: TObject);
begin
  Ok_actExecute(self);
  DM.Free;
end;

procedure TfrmGetParamValue_calc.FormShow(Sender: TObject);
begin
  PriceGridInfo.SetFocus;
end;

end.
