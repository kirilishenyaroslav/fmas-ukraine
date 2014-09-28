unit UGetParamValue;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls, UParamsReestr,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxTextEdit, FIBDataSet, pFIBDataSet, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, FIBDatabase, pFibDataBase;

type
  TParamFilterValues=array of int64;
  TParamTextFilterValues=array of string;

  TfrmGetParamValue = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
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
    ParamColumn: TcxGridDBColumn;
    PriceGridInfoDBTableView1: TcxGridDBTableView;
    SpecialityView: TcxGridDBTableView;
    PriceGridInfoLevel1: TcxGridLevel;
    ParamsDataSet: TpFIBDataSet;
    ParamsDataSource: TDataSource;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ResultId:Integer;
    ResultText:String;
    ParamType:Smallint;
    constructor Create(AOwner:TComponent;
                       ParamType:Smallint;
                       FilterValues:TParamFilterValues;
                       DataBase:TpFibDataBase;
                       Transaction:TpFibTransaction);
  end;

implementation

{$R *.dfm}

constructor TfrmGetParamValue.Create(AOwner:TComponent;
                                     ParamType:Smallint;
                                     FilterValues:TParamFilterValues;
                                     DataBase:TpFibDataBase;
                                     Transaction:TpFibTransaction);
begin
     inherited Create(AOwner);
     ParamsDataSet.Database   :=DataBase;
     ParamsDataSet.Transaction:=Transaction;
     Self.ParamType:=ParamType;

     if (ParamType=0)
     then begin
               ParamsDataSet.SelectSQL.Text:='select * from CN_SP_FACUL';
               ParamColumn.Caption:='Факультет';
               ParamColumn.DataBinding.FieldName:='NAME';
     end;
     if (ParamType=1)
     then begin
               ParamsDataSet.SelectSQL.Text:='select * from CN_SP_SPEC S, CN_JN_FACUL_SPEC JS where S.ID_SPEC=JS.ID_SPEC and JS.ID_FACUL='+IntToStr(FilterValues[0]);
               ParamColumn.Caption:='Спеціальність';
               ParamColumn.DataBinding.FieldName:='NAME';
     end;
     if (ParamType=2)
     then begin
               ParamsDataSet.SelectSQL.Text:='select * from CN_SP_FORM_STUD';
               ParamColumn.Caption:='Форма навчання';
               ParamColumn.DataBinding.FieldName:='NAME';
     end;
     if (ParamType=3)
     then begin
               ParamsDataSet.SelectSQL.Text:='select * from CN_SP_NATIONAL';
               ParamColumn.Caption:='Національність';
               ParamColumn.DataBinding.FieldName:='NAME';
     end;
     if (ParamType=4)
     then begin
               ParamsDataSet.SelectSQL.Text:='select * from CN_SP_KAT_STUD';
               ParamColumn.Caption:='Категорія';
               ParamColumn.DataBinding.FieldName:='NAME';
     end;
     if (ParamType=5)
     then begin
               ParamsDataSet.SelectSQL.Text:='select * from CN_GET_CURS';
               ParamColumn.Caption:='Курс';
               ParamColumn.DataBinding.FieldName:='CURS';
     end;

     ParamsDataSet.Open;
end;

procedure TfrmGetParamValue.cxButton1Click(Sender: TObject);
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

procedure TfrmGetParamValue.cxButton2Click(Sender: TObject);
begin
      ModalResult:=mrNo;
end;

end.
