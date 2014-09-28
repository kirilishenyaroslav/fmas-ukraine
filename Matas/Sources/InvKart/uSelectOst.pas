{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                              Инвентарная картотека                           }
{                                                                              }
{               (c) Шамарин Ю.В., Данильченко А.Н.     2004-2007               }
{                                                                              }
unit uSelectOst;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ClassInvKart, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, cxCheckBox, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridCustomView, cxGrid, ImgList, cxClasses, cxLookAndFeelPainters,
  StdCtrls, cxButtons, ExtCtrls, FIBDataSet, pFIBDataSet, Placemnt, uResources;

type
  TfmWievOst = class(TForm)
    cxStyleRepository1: TcxStyleRepository;
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
    ImageListButton: TImageList;
    cxGridInvOst: TcxGrid;
    cxGridInvOstDBTableView1: TcxGridDBTableView;
    cxGridInvOstDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridInvOstLevel1: TcxGridLevel;
    PanelButton: TPanel;
    cxButtonSelect: TcxButton;
    cxButtonTaNuEgo: TcxButton;
    pFIBDataSetOstatki: TpFIBDataSet;
    DataSourceOst: TDataSource;
    cxGridInvOstDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridInvOstDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridInvOstDBTableView1DBColumn4: TcxGridDBColumn;
    procedure cxButtonTaNuEgoClick(Sender: TObject);
    procedure cxButtonSelectClick(Sender: TObject);
    procedure cxGridInvOstDBTableView1DblClick(Sender: TObject);
  private
    id_mola, id_nomna : int64;
  public
    ResultArray : Variant;
  end;

  function GetOst(AOwner:TComponent; id_mol, id_nomn : int64):Variant;stdcall;
  exports GetOst;
var
  fmWievOst: TfmWievOst;

implementation

{$R *.dfm}

function GetOst(AOwner:TComponent; id_mol, id_nomn : int64):Variant;
var
 form : TfmWievOst;
 ds   : integer;
begin
      form := TfmWievOst.Create(AOwner);
      form.id_mola  := id_mol;
      form.id_nomna := id_nomn;

      //************ Настройка констант *******************
      form.Caption                                    := MAT_INV_system_name + MAT_INV_Show_Ost;
      form.cxButtonTaNuEgo.Caption                    := MAT_INV_Cansel;
      form.cxButtonSelect.Caption                     := MAT_INV_izn_vibor;
      form.cxGridInvOstDBTableView1DBColumn1.Caption  := MAT_INV_nomn_num;
      form.cxGridInvOstDBTableView1DBColumn2.Caption  := MAT_INV_Name;
      form.cxGridInvOstDBTableView1DBColumn3.Caption  := MAT_INV_Kol_vo;
      form.cxGridInvOstDBTableView1DBColumn4.Caption  := MAT_INV_obj_sum;
      //****************** ending *************************

      form.pFIBDataSetOstatki.Close;
      try
        form.pFIBDataSetOstatki.SQLs.SelectSQL.Text := 'select * from MAT_SEL_MO_OST_CUR_SPEC('+IntToStr(form.id_mola)+',0,'+IntToStr(form.id_nomna)+')';
        form.pFIBDataSetOstatki.Open;
      except on E:Exception do begin
        ShowMessage(E.Message);
        exit;
      end end;

      form.ShowModal;
      GetOst := form.ResultArray;
      form.Free;
end;


procedure TfmWievOst.cxButtonTaNuEgoClick(Sender: TObject);
begin
    Close;
end;

procedure TfmWievOst.cxButtonSelectClick(Sender: TObject);
begin
    ResultArray := VarArrayCreate([0,4], varVariant);
    ResultArray[0] := pFIBDataSetOstatki['ID_OST'];
    ResultArray[1] := pFIBDataSetOstatki['NOMN'];
    ResultArray[2] := pFIBDataSetOstatki['NAME'];
    ResultArray[3] := pFIBDataSetOstatki['KOL_MAT'];
    Close;
end;

procedure TfmWievOst.cxGridInvOstDBTableView1DblClick(Sender: TObject);
begin
    cxButtonSelect.Click;
end;

end.
