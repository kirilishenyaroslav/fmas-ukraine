unit UGetParamValue_ex;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxTextEdit, FIBDataSet, pFIBDataSet, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, FIBDatabase, pFibDataBase, ActnList,
  cn_common_funcs, cnConsts, IBase, cxCalendar;

type
  TParamFilterValues=array of int64;
  TParamTextFilterValues=array of string;

  TfrmGetParamValue = class(TForm)
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
    DB: TpFIBDatabase;
    pFIBTransaction1: TpFIBTransaction;
    kod_spec: TcxGridDBColumn;
    procedure Ok_actExecute(Sender: TObject);
    procedure Cancel_actExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FacultyViewDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ResultId:Integer;
    ResultText:String;
    ParamType:Smallint;
    PLanguageIndex:byte;
    constructor Create(AOwner:TComponent;
                       ParamType:Smallint;
                       FilterValues:TParamFilterValues;
                       DBh:TISC_DB_HANDLE);
  end;

implementation

uses UParamsReestr_ex;

{$R *.dfm}

constructor TfrmGetParamValue.Create(AOwner:TComponent;
                                     ParamType:Smallint;
                                     FilterValues:TParamFilterValues;
                                     DBh:TISC_DB_HANDLE );
begin
    inherited Create(AOwner);
    DB.Handle := DBh;
    pFIBTransaction1.StartTransaction;
    Self.ParamType:=ParamType;

    case ParamType of
    0: ParamsDataSet.SelectSQL.Text:='select NAME, ID_FACUL from CN_SP_FACUL ORDER BY NAME';
    1:begin
        kod_spec.DataBinding.FieldName:='CODE_SPEC';
        kod_spec.Visible:=True;
        ParamsDataSet.SelectSQL.Text:='select * from CN_SP_SPEC S, CN_JN_FACUL_SPEC JS where IS_DELETED=0 AND S.ID_SPEC=JS.ID_SPEC and JS.ID_FACUL='+IntToStr(FilterValues[0])+' ORDER BY NAME';
      end;
    2: ParamsDataSet.SelectSQL.Text:='select * from CN_SP_FORM_STUD WHERE is_deleted = 0 ORDER BY NAME';
    3: ParamsDataSet.SelectSQL.Text:='select * from CN_SP_NATIONAL ORDER BY NAME';
    4: ParamsDataSet.SelectSQL.Text:='select * from CN_SP_KAT_STUD ORDER BY NAME';
    5: ParamsDataSet.SelectSQL.Text:='select * from CN_GET_CURS ORDER BY NAME';
    end;

    ParamsDataSet.Open;
end;

procedure TfrmGetParamValue.Ok_actExecute(Sender: TObject);
begin
    if (ParamsDataSet.RecordCount>0)
    then begin
                if (ParamType=0)
                then begin
                          ResultId  :=ParamsDataSet.FieldByName('ID_FACUL').Value;
                          ResultText:=ParamsDataSet.FieldByName('NAME').AsString;
                end;
                if (ParamType=1)
                then begin
                          ResultId  :=ParamsDataSet.FieldByName('ID_SPEC').Value;
                          ResultText:=ParamsDataSet.FieldByName('NAME').AsString;
                end;
                if (ParamType=2)
                then begin
                          ResultId  :=ParamsDataSet.FieldByName('ID_FORM_STUD').Value;
                          ResultText:=ParamsDataSet.FieldByName('NAME').AsString;
                end;
                if (ParamType=3)
                then begin
                          ResultId  :=ParamsDataSet.FieldByName('ID_NATIONAL').Value;
                          ResultText:=ParamsDataSet.FieldByName('NAME').AsString;
                end;
                if (ParamType=4)
                then begin
                          ResultId  :=ParamsDataSet.FieldByName('ID_KAT_STUD').Value;
                          ResultText:=ParamsDataSet.FieldByName('NAME').AsString;
                end;
                if (ParamType=5)
                then begin
                          ResultId  :=ParamsDataSet.FieldByName('CURS').Value;
                          ResultText:=ParamsDataSet.FieldByName('CURS').AsString;
                end;
    end;
    ModalResult:=mrYes;
end;

procedure TfrmGetParamValue.Cancel_actExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmGetParamValue.FormCreate(Sender: TObject);
begin
  PLanguageIndex        :=cn_Common_Funcs.cnLanguageIndex();
  caption               := cn_StudyParams_Title[PLanguageIndex];
  name_table.Caption    := cn_Name_Column[PLanguageIndex];
  kod_spec.Caption      := cn_Spec_Kod[PLanguageIndex];
  ok_button.Caption     := cn_Accept[PLanguageIndex];
  ok_button.Hint        := cn_Accept[PLanguageIndex];
  cancel_button.Caption := cn_Cancel[PLanguageIndex];
  cancel_button.Hint    := cn_Cancel[PLanguageIndex];
end;

procedure TfrmGetParamValue.FacultyViewDblClick(Sender: TObject);
begin
  Ok_actExecute(self);
end;

procedure TfrmGetParamValue.FormShow(Sender: TObject);
begin
  PriceGridInfo.SetFocus;
end;

end.
