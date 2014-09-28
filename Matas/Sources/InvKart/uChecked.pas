{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                              Инвентарная картотека                           }
{                                                                              }
{               (c) Шамарин Ю.В., Данильченко А.Н.     2004-2007               }
{                                                                              }
unit uChecked;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, FIBDataSet, pFIBDataSet,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxLookAndFeelPainters,
  StdCtrls, cxButtons, ExtCtrls, uResources, ActnList,
  cxTL, cxMaskEdit, cxInplaceContainer, cxDBTL, cxTLData, cxCheckBox;

type
  TfmChacked = class(TForm)
    cxGridNorma: TcxGrid;
    cxGridNormaDBTableView1: TcxGridDBTableView;
    cxGridNormaLevel1: TcxGridLevel;
    DataSetCheck: TpFIBDataSet;
    DataSourceCheck: TDataSource;
    DataSetCheckID_INV_GRP: TFIBBCDField;
    DataSetCheckLINK_TO: TFIBBCDField;
    DataSetCheckNAME_GRP: TFIBStringField;
    DataSetCheckHAS_CHILD: TFIBSmallIntField;
    DataSetCheckKOD_GRP: TFIBBCDField;
    Panel1: TPanel;
    cxButtonCheck: TcxButton;
    cxGridNormaDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridNormaDBTableView1DBColumn2: TcxGridDBColumn;
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
    ActionList1: TActionList;
    Action1: TAction;
    cxDBTreeListPapka: TcxDBTreeList;
    cxDBTreeListPapkacxDBTreeListColumn1: TcxDBTreeListColumn;
    pFIBDataSetSelectErrors: TpFIBDataSet;
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    ResultArray : Variant;
  end;
    function GetCheck(AOwner:TComponent):Variant;
    exports GetCheck;
var
  fmChacked: TfmChacked;

implementation

{$R *.dfm}

function GetCheck(AOwner:TComponent):Variant;
var
 formulya : TfmChacked;
 ds   : integer;
begin
      formulya := TfmChacked.Create(AOwner);
      formulya.cxButtonCheck.Caption                     := MAT_INV_izn_vibor;
      formulya.cxGridNormaDBTableView1DBColumn1.Caption  := MAT_INV_Grp_name;
      formulya.cxGridNormaDBTableView1DBColumn2.Caption  := MAT_INV_id_grp;
      formulya.Caption                                   := MAT_INV_system_name + MAT_INV_name_fm;

      begin
          formulya.DataSetCheck.Transaction.StartTransaction;
          formulya.DataSetCheck.Close;
          try
            formulya.DataSetCheck.SQLs.SelectSQL.Text := 'select * from MAT_DT_INV_GROUPS';
            formulya.DataSetCheck.Open;
            except on E:Exception do begin
            ShowMessage(E.Message);
            exit;
            end end;
      end;
      formulya.ShowModal;
      GetCheck := formulya.ResultArray;
      formulya.Free;

end;

procedure TfmChacked.Action1Execute(Sender: TObject);
var
    idishnik_grp, flagochekk : integer;
begin
 if Not Self.DataSetCheck.IsEmpty
 then begin
    idishnik_grp := DataSetCheck['ID_INV_GRP'];
    pFIBDataSetSelectErrors.Close;
    pFIBDataSetSelectErrors.SQLs.SelectSQL.Text := 'select * from MAT_INV_CHACKED_LINKTO('+IntToStr(idishnik_grp)+')';
    pFIBDataSetSelectErrors.Open;
    flagochekk := pFIBDataSetSelectErrors.FieldByName('FLAG').AsInteger;
  if flagochekk = 1 then
  begin
    ShowMessage(MAT_INV_Error_add_Kart);
    exit;
  end else
  begin
    ResultArray := VarArrayCreate([0,1], varVariant);
    ResultArray[0] := Self.DataSetCheck['ID_INV_GRP'];
    Close;
  end;
  end;
end;

end.
