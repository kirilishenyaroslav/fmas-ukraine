unit UGetParamValueforstud;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxTextEdit, FIBDataSet, pFIBDataSet, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, FIBDatabase, pFibDataBase, ActnList,
  cn_common_funcs, cnConsts, ibase;

type
  TParamFilterValues=array of int64;
  TParamTextFilterValues=array of string;

  TfrmGetParamValueforstud = class(TForm)
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
    ParamGridInfo: TcxGrid;
    ParamView: TcxGridDBTableView;
    name_table: TcxGridDBColumn;
    ParamGridInfoDBTableView1: TcxGridDBTableView;
    SpecialityView: TcxGridDBTableView;
    ParamGridInfoLevel1: TcxGridLevel;
    ParamsDataSet: TpFIBDataSet;
    ParamsDataSource: TDataSource;
    ActionList1: TActionList;
    Ok_act: TAction;
    Cancel_act: TAction;
    pFIBDatabase1: TpFIBDatabase;
    pFIBTransaction1: TpFIBTransaction;
    procedure Ok_actExecute(Sender: TObject);
    procedure Cancel_actExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ParamViewDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ResultId:Integer;
    ResultText:String;
   // ParamType:Smallint;
    PLanguageIndex:byte;
    constructor Create(AOwner:TComponent; aHandle:TISC_DB_HANDLE);
  end;

implementation

{$R *.dfm}

constructor TfrmGetParamValueforstud.Create(AOwner:TComponent; aHandle:TISC_DB_HANDLE);
begin
  inherited Create(AOwner);

  pFIBDatabase1.Handle:=aHandle;
  pFIBDatabase1.Connected:=true;
  pFIBTransaction1.StartTransaction;

  ParamsDataSet.Close;
  ParamsDataSet.SQLs.SelectSQL.Text:='select id_type_action as id, name_action as name from CN_ini_type_action order by name_action';
  ParamsDataSet.Open;
end;

procedure TfrmGetParamValueforstud.Ok_actExecute(Sender: TObject);
begin
  if (ParamsDataSet.RecordCount>0) then
   begin
    ResultId   :=ParamsDataSet.FieldByName('ID').Value;
    ResultText :=ParamsDataSet.FieldByName('NAME').AsString;
   end;
  ModalResult:=mrOk;
end;

procedure TfrmGetParamValueforstud.Cancel_actExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmGetParamValueforstud.FormCreate(Sender: TObject);
begin
  PLanguageIndex        :=cn_Common_Funcs.cnLanguageIndex();
  caption               := cn_StudyParams_Title[PLanguageIndex];
  name_table.Caption    := cn_Name_Column[PLanguageIndex];
  ok_button.Caption     := cn_Accept[PLanguageIndex];
  ok_button.Hint        := cn_Accept[PLanguageIndex];
  cancel_button.Caption := cn_Cancel[PLanguageIndex];
  cancel_button.Hint    := cn_Cancel[PLanguageIndex];
end;

procedure TfrmGetParamValueforstud.ParamViewDblClick(Sender: TObject);
begin
  Ok_actExecute(self);
end;

procedure TfrmGetParamValueforstud.FormShow(Sender: TObject);
begin
  ParamGridInfo.SetFocus;
end;

end.
