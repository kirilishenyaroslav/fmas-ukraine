unit ProvUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DogPayFulfilUnit, DB, FIBDataSet, pFIBDataSet, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxCurrencyEdit, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxButtonEdit, cxCheckBox,
  cxImage, ExtCtrls, ImgList, cxLabel, cxContainer, cxTextEdit, cxMemo,
  Buttons, Menus;

type
  TfrmProv = class(TForm)
    DataSet: TpFIBDataSet;
    DataSource: TDataSource;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1SUMMA: TcxGridDBColumn;
    cxGrid1DBTableView1DB_REGEST_NUM: TcxGridDBColumn;
    cxGrid1DBTableView1KR_REGEST_NUM: TcxGridDBColumn;
    cxGrid1DBTableView1MONTH: TcxGridDBColumn;
    cxGrid1DBTableView1YEAR: TcxGridDBColumn;
    cxGrid1DBTableView1SMETA: TcxGridDBColumn;
    cxGrid1DBTableView1RAZD: TcxGridDBColumn;
    cxGrid1DBTableView1STAT: TcxGridDBColumn;
    cxGrid1DBTableView1KEKV: TcxGridDBColumn;
    cxGrid1DBTableView1ISDOC: TcxGridDBColumn;
    ImageList1: TImageList;
    Panel1: TPanel;
    Panel2: TPanel;
    TypeDocEdit: TcxTextEdit;
    cxLabel1: TcxLabel;
    NumDocEdit: TcxTextEdit;
    cxLabel2: TcxLabel;
    DateDocEdit: TcxTextEdit;
    cxLabel3: TcxLabel;
    DateRegEdit: TcxTextEdit;
    CustEdit: TcxTextEdit;
    cxLabel4: TcxLabel;
    NoteMemo: TcxMemo;
    Panel3: TPanel;
    cxButton1: TcxButton;
    Bevel1: TBevel;
    cxLabel5: TcxLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxGrid1DBTableView1ISDOCCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
  public
   id_doc : int64;
   is_pay : integer;
   id_session : int64;
   procedure SelectAll;
  end;

var
  frmProv: TfrmProv;

implementation
uses LoadDogManedger, dogLoaderUnit, LangUnit, KorrUnit;
{$R *.dfm}

{ TfrmProv }

procedure TfrmProv.SelectAll;
begin
 DataSet.Close;
 DataSet.ParamByName('ID_DOC').AsInt64 := id_doc;
 DataSet.ParamByName('IS_PAY').AsInteger := is_pay;
 DataSet.ParamByName('ID_SESSION').AsInt64 := id_session;
 DataSet.Open;
end;

procedure TfrmProv.FormShow(Sender: TObject);
begin
 SelectAll;
end;

procedure TfrmProv.cxButton1Click(Sender: TObject);
begin
 Close;
end;

procedure TfrmProv.cxGrid1DBTableView1ISDOCCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
 if AViewInfo.GridRecord.Values[cxGrid1DBTableView1ISDOC.Index] = 1 then begin
  ACanvas.FillRect(AViewInfo.Bounds);
  ImageList1.Draw(ACanvas.Canvas, AViewInfo.Bounds.Left + 1, AViewInfo.Bounds.Top, 0);
  ADone := true;
 end;
end;

procedure TfrmProv.N1Click(Sender: TObject);
begin
 LoadShablon(self, TfrmPayFulfil(Owner).pFIBDatabase1.Handle, fsMDIChild, DataSet['DB_ID_DOG'], 'prosmotr', DataSet.FieldByName('DB_TIP_DOG').AsVariant, PChar(DataSet.FieldByName('DB_NAME_SHABLON').asString), Nil);
end;

procedure TfrmProv.N2Click(Sender: TObject);
begin
 LoadShablon(self, TfrmPayFulfil(Owner).pFIBDatabase1.Handle, fsMDIChild, DataSet['KR_ID_DOG'], 'prosmotr', DataSet.FieldByName('KR_TIP_DOG').AsVariant, PChar(DataSet.FieldByName('KR_NAME_SHABLON').asString), Nil);
end;

procedure TfrmProv.FormCreate(Sender: TObject);
begin
 LangPackApply(Self);
end;

procedure TfrmProv.cxGrid1DBTableView1DblClick(Sender: TObject);
var
 frm : TfrmKorr;
begin
 if DataSet.RecordCount = 0 then Exit;
 frm := TfrmKorr.Create(Self);
 frm.id_prov := DataSet['ID_PROV'];
 frm.SelectAll;
 frm.ShowModal;
 frm.Free;
end;

procedure TfrmProv.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = VK_RETURN then cxGrid1DBTableView1DblClick(Self); 
end;

end.
