{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                              Инвентарная картотека                           }
{                                                                              }
{               (c) Шамарин Ю.В., Данильченко А.Н.     2004-2007               }
{                                                                              }
unit uNormIznos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid, FIBDataSet, pFIBDataSet, cxSplitter, ExtCtrls, cxContainer,
  cxTextEdit, cxMemo, FIBDatabase, pFIBDatabase, ClassInvKart,
  ActnList, cxCheckBox, MainInvKartForm, uResources;

type
  TfmNormIznos = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    cxButtonOk: TcxButton;
    cxButtonCansel: TcxButton;
    cxGridNormaDBTableView1: TcxGridDBTableView;
    cxGridNormaLevel1: TcxGridLevel;
    cxGridNorma: TcxGrid;
    cxGridNormaDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridNormaDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridNormaDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridNormaDBTableView1DBColumn4: TcxGridDBColumn;
    DataSetNorma: TpFIBDataSet;
    DataSourceNorma: TDataSource;
    cxStyleRepositoryNorm: TcxStyleRepository;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyleYellow: TcxStyle;
    cxStyleFontBlack: TcxStyle;
    cxStyleMalin: TcxStyle;
    cxStyleBorder: TcxStyle;
    cxStylemalinYellow: TcxStyle;
    cxStyleGrid: TcxStyle;
    ForHaeder: TcxStyle;
    AfterSelection: TcxStyle;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    Panel1: TPanel;
    cxSplitter1: TcxSplitter;
    cxGridNormaDBTableView1DBColumn5: TcxGridDBColumn;
    cxGridNormaDBTableView1DBColumn6: TcxGridDBColumn;
    cxMemoFormula: TcxMemo;
    DataSetMeth: TpFIBDataSet;
    DataSourceMeth: TDataSource;
    cxButtonAdd: TcxButton;
    cxButtonChange: TcxButton;
    cxButtonDel: TcxButton;
    ToolButton1: TToolButton;
    cxButtonRefresh: TcxButton;
    cxTextEditMethod: TcxTextEdit;
    LabelMethod: TLabel;
    LabelFormula: TLabel;
    DataSetMethFORMULA: TFIBStringField;
    DataSetMethMETHOD: TFIBStringField;
    cxTextEditPer: TcxTextEdit;
    LabelPer: TLabel;
    DataSetMethPER: TFIBSmallIntField;
    cxTextEditTipi: TcxTextEdit;
    LabelTip: TLabel;
    DataSetMethTIPI: TFIBSmallIntField;
    DataSetNormaID_NORM_IZN: TFIBBCDField;
    DataSetNormaNAME: TFIBStringField;
    DataSetNormaPERCENT: TFIBFloatField;
    DataSetNormaPER_PERIOD: TFIBSmallIntField;
    DataSetNormaFORMULA: TFIBStringField;
    DataSetNormaSROK_YEAR: TFIBSmallIntField;
    DataSetNormaSROK_MONTH: TFIBSmallIntField;
    DataSetNormaID_METOD: TFIBBCDField;
    DataSetNormaNAME1: TFIBStringField;
    DataSetNormaTIP: TFIBSmallIntField;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    procedure cxButtonCanselClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DataSetMethAfterScroll(DataSet: TDataSet);
    procedure cxGridNormaDBTableView1DblClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure Action4Execute(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
    procedure cxButtonRefreshClick(Sender: TObject);
  private
        FlagNaAdd : boolean;
        myform    : TfmMainIvKartForm;
        uchet     : integer;
  public
        ResultArray : Variant;
  end;

  function GetNorm(AOwner:TComponent; fg : Boolean):Variant;stdcall;
  exports GetNorm;
var
  fmNormIznos: TfmNormIznos;

implementation

uses uAddNorma;

{$R *.dfm}

function GetNorm(AOwner:TComponent; fg : Boolean):Variant;
var
 form : TfmNormIznos;
 ds   : integer;
begin
      form := TfmNormIznos.Create(AOwner);
      form.FlagNaAdd := fg;
      if form.FlagNaAdd = true then
      begin
          ds := 0;
          form.uchet := ds;
      end else
      begin
          ds:= 1;
          form.uchet := ds;
      end;
      begin
          form.DataSetNorma.Transaction.StartTransaction;
          form.DataSetNorma.Close;
          try
            form.DataSetNorma.SQLs.SelectSQL.Text := 'select * from MAT_INV_SEL_AM_IZN('+IntToStr(ds)+')';
            form.DataSetNorma.Open;
            except on E:Exception do begin
            ShowMessage(E.Message);
            exit;
            end end;
      end;
      form.ShowModal;
      GetNorm := form.ResultArray;
      form.Free;
end;

procedure TfmNormIznos.cxButtonCanselClick(Sender: TObject);
begin
    Close;
    DataSetNorma.Active:= false;
end;

procedure TfmNormIznos.FormCreate(Sender: TObject);
begin
     cxButtonAdd.Caption                      := MAT_INV_Add;
     cxButtonChange.Caption                   := MAT_INV_Change;
     cxButtonDel.Caption                      := MAT_INV_Delete;
     cxButtonRefresh.Caption                  := MAT_INV_Refrash;
     cxButtonOk.Caption                       := MAT_INV_izn_vibor;
     cxButtonCansel.Caption                   := MAT_INV_Cansel;
     Caption                                  := MAT_INV_system_name + MAT_INV_izn_caption;
     cxGridNormaDBTableView1DBColumn1.Caption := MAT_INV_Name;
     cxGridNormaDBTableView1DBColumn2.Caption := MAT_INV_Percent;
     cxGridNormaDBTableView1DBColumn3.Caption := MAT_INV_izn_period;
     cxGridNormaDBTableView1DBColumn4.Caption := MAT_INV_izn_God;
     cxGridNormaDBTableView1DBColumn5.Caption := MAT_INV_izn_Month;
     LabelMethod.Caption                      := MAT_INV_izn_method;
     LabelFormula.Caption                     := MAT_INV_izn_formula;
     LabelPer.Caption                         := MAT_INV_PerNach_Perc;
     LabelTip.caption                         := MAT_INV_norm_tip;
     //cxSplitter1.CloseSplitter;
     DataSetMeth.SQLs.SelectSQL.Text  := 'select * from MAT_INV_SEL_NORM_FORMULA (?ID_NORM_IZN)';
     DataSetNorma.Active := true;
     DataSetMeth.Active  := true;
end;

procedure TfmNormIznos.DataSetMethAfterScroll(DataSet: TDataSet);
begin
     if (cxTextEditMethod.Text            <> null) and
        (cxTextEditPer.Text               <> null) and
        (cxTextEditTipi.Text              <> null) and
        (cxMemoFormula.Text               <> null) then
        begin
            cxTextEditMethod.Text         := DataSetMeth.FieldByName('METHOD').AsString;
            cxMemoFormula.Text            := DataSetMeth.FieldByName('FORMULA').AsString;
            if DataSetMeth.FieldByName('PER').AsString = '0' then
            begin
                cxTextEditPer.Text            := MAT_INV_const_Pomesyachno;
            end;
            if DataSetMeth.FieldByName('PER').AsString = '1' then
            begin
                cxTextEditPer.Text            := MAT_INV_const_Pokvartalno;
            end;
            if DataSetMeth.FieldByName('PER').AsString = '2' then
            begin
                cxTextEditPer.Text            := MAT_INV_const_Ejegodno;
            end;
            if DataSetMeth.FieldByName('TIPI').AsString = '0' then
            begin
                cxTextEditTipi.Text           := MAT_INV_norm_buh_uch;
            end;
            if DataSetMeth.FieldByName('TIPI').AsString = '1' then
            begin
                cxTextEditTipi.Text           := MAT_INV_norm_nal_uch;
            end;
        end;
end;

procedure TfmNormIznos.cxGridNormaDBTableView1DblClick(Sender: TObject);
begin
     cxButtonOk.click;
end;

procedure TfmNormIznos.Action1Execute(Sender: TObject);
begin
 if Not Self.DataSetNorma.IsEmpty
  then begin
   ResultArray := VarArrayCreate([0,9], varVariant);
   ResultArray[0] := Self.DataSetNorma['ID_NORM_IZN'];
   ResultArray[1] := Self.DataSetNorma['NAME'];
   if Self.DataSetNorma.FieldByName('ID_METOD').IsNull then
    ResultArray[2] := 0
   else
    ResultArray[2] := Self.DataSetNorma['ID_METOD'];
   if Self.DataSetNorma.FieldByName('NAME1').IsNull then
    ResultArray[3] := ''
   else
    ResultArray[3] := Self.DataSetNorma['NAME1'];
   if Self.DataSetNorma.FieldByName('PERCENT').IsNull then
    ResultArray[4] := 0.00
   else
    ResultArray[4] := Self.DataSetNorma['PERCENT'];
   if Self.DataSetNorma.FieldByName('PER_PERIOD').IsNull then
    ResultArray[5] := 0
   else
    ResultArray[5] := Self.DataSetNorma['PER_PERIOD'];
   if Self.DataSetNorma.FieldByName('SROK_YEAR').IsNull then
    ResultArray[6] := 0
   else
    ResultArray[6] := Self.DataSetNorma['SROK_YEAR'];
   if Self.DataSetNorma.FieldByName('SROK_MONTH').IsNull then
    ResultArray[7] := 0
   else
    ResultArray[7] := Self.DataSetNorma['SROK_MONTH'];
   if Self.DataSetNorma.FieldByName('FORMULA').IsNull then
    ResultArray[8] := ''
   else
    ResultArray[8] := Self.DataSetNorma['FORMULA'];
   if Self.DataSetNorma.FieldByName('TIP').IsNull then
    ResultArray[9] := 0
   else
    ResultArray[9] := Self.DataSetNorma['TIP'];
    Close;
  end;
end;

procedure TfmNormIznos.Action2Execute(Sender: TObject);
var
    st_1, st_2, meth : string;
    int_2, int_3, int_4, int_5 : integer;
    f : double;
    id : int64;
    uch: integer;
begin
    uch := uchet;
    if ShowNorm(self, true, st_1, st_2, meth, int_2, int_3, int_4, int_5, f, id, uch) then
    begin
        cxButtonRefreshClick(Sender);
        DataSetNorma.Locate('ID_NORM_IZN', id, []);
    end;
end;

procedure TfmNormIznos.Action3Execute(Sender: TObject);
var
    st_1, st_2, meth : string;
    int_2, int_3, int_4, int_5 : integer;
    f : double;
    id : int64;
    uch: integer;
begin
    uch := uchet;
    st_1  := DataSetNorma.FieldByName('NAME').AsString;
    st_2  := DataSetNorma.FieldByName('FORMULA').AsString;
    meth  := DataSetMeth.FieldByName('METHOD').AsString;
    int_2 := DataSetNorma.FieldByName('PER_PERIOD').AsInteger;
    int_3 := DataSetNorma.FieldByName('TIP').AsInteger;
    int_4 := DataSetNorma.FieldByName('SROK_YEAR').AsInteger;
    int_5 := DataSetNorma.FieldByName('SROK_MONTH').AsInteger;
    f     := DataSetNorma.FieldByName('PERCENT').AsFloat;
    id    := DataSetNorma.FieldByName('ID_NORM_IZN').AsInteger;
    if ShowNorm(self, false, st_1, st_2, meth, int_2, int_3, int_4, int_5, f, id, uch) then
    begin
        cxButtonRefreshClick(Sender);
        DataSetNorma.Locate('ID_NORM_IZN', id, []);
    end;
end;

procedure TfmNormIznos.Action4Execute(Sender: TObject);
var
    id_del : int64;
begin
            if MessageBox(Handle,Pchar(MAT_INV_delete_pole+':  ' + DataSetNorma.FieldByName('NAME').AsString+'?'), Pchar(MAT_INV_Attention),mb_YesNO)=mrYes
            then
            begin
                // Удаляем поле
                id_del := DataSetNorma['ID_NORM_IZN'];
                DeleteNorma(id_del);
                cxButtonRefresh.Click;
            end;
end;

procedure TfmNormIznos.Action5Execute(Sender: TObject);
begin
    DataSetNorma.CloseOpen(false);
end;

procedure TfmNormIznos.cxButtonRefreshClick(Sender: TObject);
begin
    DataSetNorma.CloseOpen(false);
end;

end.
