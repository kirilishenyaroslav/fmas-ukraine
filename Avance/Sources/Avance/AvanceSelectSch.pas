unit AvanceSelectSch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxLabel, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, AddChangeProvAvance, Un_R_file_Alex,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  RxMemDS, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet;

type
  TfmAvanceSelectSch = class(TForm)
    cxComboBox1: TcxComboBox;
    cxLabel1: TcxLabel;
    cxButtonTake: TcxButton;
    cxButtonClose: TcxButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    RxSch: TRxMemoryData;
    DataSource1: TDataSource;
    StyleRepository: TcxStyleRepository;
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
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyleYellow: TcxStyle;
    cxStyleFontBlack: TcxStyle;
    cxStyleMalin: TcxStyle;
    cxStyleBorder: TcxStyle;
    cxStylemalinYellow: TcxStyle;
    cxStyleGrid: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    DB: TpFIBDatabase;
    DataSetSch: TpFIBDataSet;
    Tr: TpFIBTransaction;
    procedure cxButtonTakeClick(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxButtonCloseClick(Sender: TObject);
  private
  public
    { Public declarations }
  end;

function ShowSelectSch(db : TpFIBDatabase; tran : TpFIBTransaction;id_sys, id_sm, id_rz, id_st: int64; id_shablon, prih, use_exp_sys, id_form_u: integer; date_ao : tdate;  var id : int64; var num, title : string) : boolean;

implementation

{$R *.dfm}

function ShowSelectSch(db : TpFIBDatabase; tran : TpFIBTransaction;id_sys, id_sm, id_rz, id_st: int64; id_shablon, prih, use_exp_sys, id_form_u: integer;date_ao : tdate;  var id : int64; var num, title : string) : boolean;
var
    T : TfmAvanceSelectSch;
    id_locate : integer;
begin
    T := TfmAvanceSelectSch.Create(nil);
    T.cxButtonTake.Caption  := Un_R_file_Alex.MY_ACTION_OK;
    T.cxButtonClose.Caption := Un_R_file_Alex.MY_BUTTON_CLOSE;
    T.Caption               := Un_R_file_Alex.J4_FORM_SELECT_SCH;
    T.cxLabel1.Caption      := Un_R_file_Alex.J4_SELECT_SCH;
    T.cxGrid1DBTableView1DBColumn1.Caption := Un_R_file_Alex.KASSA_KOD;
    T.cxGrid1DBTableView1DBColumn2.Caption := Un_R_file_Alex.BANK_DAY_SHOW_SCH_NAME_;

    T.DataSetSch.Database := db;
    T.DataSetSch.Transaction := tran;
    T.DataSetSch.Transaction.StartTransaction;
    if(id_shablon =1) or(id_shablon =0) or(id_shablon =null) or (use_exp_sys=0) then
    begin
        T.DataSetSch.Close;
        T.DataSetSch.SQLs.SelectSQL.Text := 'SELECT * FROM J4_SELECT_ALL_SCH_N('+IntToStr(id_sys)+', '''+dateToStr(date_ao)+''') ';
        T.DataSetSch.Open;
        T.DataSetSch.First;
        id_locate := T.DataSetSch['ID_SCH'];
        while not  T.DataSetSch.Eof do
        begin
            T.RxSch.Open;
            T.RxSch.Insert;
            T.RxSch.FieldByName('Id').Value    :=  T.DataSetSch['ID_SCH'];
            T.RxSch.FieldByName('Kod').Value   :=  T.DataSetSch['SCH_NUM'];
            T.RxSch.FieldByName('Title').Value :=  T.DataSetSch['SCH_TITLE'];
            T.RxSch.Post;
            T.DataSetSch.Next;
        end;
    end else
    if(id_shablon =2) and (use_exp_sys=1)  then
    begin
        T.DataSetSch.Close;
        T.DataSetSch.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_GET_NATIVE_SCH_BY_SM('+IntToStr(id_form_u)+','+IntToStr(0)+','+IntToStr(id_sm)+', '''+dateToStr(date_ao)+''','+IntToStr(prih)+','+IntToStr(id_rz)+','+IntToStr(id_st)+') ';
        T.DataSetSch.Open;
        T.DataSetSch.FetchAll;
        T.DataSetSch.First;
        id_locate := T.DataSetSch['IDNATIVESCH'];
        while not  T.DataSetSch.Eof do
        begin
            T.RxSch.Open;
            T.RxSch.Insert;
            T.RxSch.FieldByName('Id').Value    :=  T.DataSetSch['IDNATIVESCH'];
            T.RxSch.FieldByName('Kod').Value   :=  T.DataSetSch['SCH_NUMBER'];
            T.RxSch.FieldByName('Title').Value :=  T.DataSetSch['SCH_TITLE'];
            T.RxSch.Post;
            T.DataSetSch.Next;
        end;
    end;



    T.RxSch.Locate('ID', id_locate, []);


    if T.ShowModal = mrOk then
    begin
        id    := T.RxSch.FieldByName('Id').Value;
        num   := T.RxSch.FieldByName('Kod').Value;
        title := T.RxSch.FieldByName('Title').Value;
        result := true;
    end else
    begin
        result := false;
    end;
end;

procedure TfmAvanceSelectSch.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (not rxSch.IsEmpty) then
  begin
    if key = VK_RETURN then ModalResult := mrOk;
  end;
end;

procedure TfmAvanceSelectSch.cxButtonTakeClick(Sender: TObject);
begin
    ModalResult := mrOK;
end;

procedure TfmAvanceSelectSch.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  if not rxSch.IsEmpty then
      modalResult := mrOK;
end;

procedure TfmAvanceSelectSch.cxButtonCloseClick(Sender: TObject);
begin
    Close;
end;

end.
