{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                              Инвентарная картотека                           }
{                                                                              }
{               (c) Шамарин Ю.В., Данильченко А.Н.     2004-2007               }
{                                                                              }
unit uShowAmVed;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ibase, cxLookAndFeelPainters, StdCtrls,
  cxButtons, ExtCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, cxGridTableView,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridDBTableView, cxGrid, ActnList, cxCheckBox,
  MainInvKartForm, uResources;

type
  TfmShowAmVedomost = class(TForm)
    PanelBotton: TPanel;
    cxButtonVibor: TcxButton;
    cxButtonGariOno: TcxButton;
    cxGridPokazDBTableView1: TcxGridDBTableView;
    cxGridPokazLevel1: TcxGridLevel;
    cxGridPokaz: TcxGrid;
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
    DataSourcePromej: TDataSource;
    pFIBDatabaseMestnaya: TpFIBDatabase;
    pFIBDataSetPodano: TpFIBDataSet;
    pFIBDataSetPodanoID_AMORT_VED: TFIBBCDField;
    pFIBDataSetPodanoTIP: TFIBIntegerField;
    pFIBDataSetPodanoDATE_AMORT: TFIBDateField;
    pFIBDataSetPodanoCOEF: TFIBBCDField;
    pFIBDataSetPodanoDATE_REC: TFIBDateField;
    pFIBDataSetPodanoPUB_ID_DOC: TFIBBCDField;
    pFIBDataSetPodanoSAVED: TFIBBooleanField;
    cxGridPokazDBTableView1DBColumn1: TcxGridDBColumn;
    ActionList1: TActionList;
    ActionLetsDo: TAction;
    procedure cxButtonGariOnoClick(Sender: TObject);
    procedure ActionLetsDoExecute(Sender: TObject);
    procedure cxGridPokazDblClick(Sender: TObject);
    procedure cxGridPokazDBTableView1DblClick(Sender: TObject);
  private
    { Private declarations }
    FormaSBasoy : TfmMainIvKartForm;
  public
    { Public declarations }
    ResultArray : Variant;
  end;
  function ShowAm_OstAmVed({formmat :TfmMainIvKartForm;} DataDescript: TISC_DB_HANDLE) : boolean;
var
  fmShowAmVedomost: TfmShowAmVedomost;

implementation

uses uAmort_selection;

{$R *.dfm}

function ShowAm_OstAmVed(DataDescript: TISC_DB_HANDLE) : boolean;
var
   W : TfmShowAmVedomost;
begin
    W := TfmShowAmVedomost.Create(nil);
    W.pFIBDatabaseMestnaya.Handle := DataDescript;

    W.Caption                          := MAT_INV_system_name + MAT_INV_look;
    W.cxButtonVibor.Caption            := MAT_INV_izn_vibor;
    W.cxButtonGariOno.Caption          := MAT_INV_Cansel;

    W.cxGridPokazDBTableView1DBColumn1.Caption := MAT_INV_date_narah;

    W.pFIBDataSetPodano.Close;
    W.pFIBDataSetPodano.SQLs.SelectSQL.Text := 'select * from MAT_DT_AMORT_VED';
    W.pFIBDataSetPodano.Open;

    W.ShowModal;
    ShowAm_OstAmVed := W.ResultArray;
    W.Free;

end;

procedure TfmShowAmVedomost.cxButtonGariOnoClick(Sender: TObject);
begin
    close;
end;

procedure TfmShowAmVedomost.ActionLetsDoExecute(Sender: TObject);
VAR
    res : Variant;
    id_OstAmved : Int64;
begin
        id_OstAmved := StrToInt64(pFIBDataSetPodano.FieldByName('ID_AMORT_VED').AsString);
        if id_OstAmved > 0 then
        begin
            res := UAmort_selection.ShowAm_Ved(pFIBDatabaseMestnaya.Handle, id_OstAmved, false);
            if VarArrayDimCount(res) > 0 then
            begin
                if (res[0]<>null) then
                begin
                    //
                end;
            end;
            close;
        end else
        begin
            ShowMessage(MAT_INV_You_must_sel_line);
        end;
end;

procedure TfmShowAmVedomost.cxGridPokazDblClick(Sender: TObject);
begin
    ActionLetsDoExecute(Self);
end;

procedure TfmShowAmVedomost.cxGridPokazDBTableView1DblClick(
  Sender: TObject);
VAR
    res : Variant;
    id_OstAmved : Int64;
begin
        id_OstAmved := StrToInt64(pFIBDataSetPodano.FieldByName('ID_AMORT_VED').AsString);
        if id_OstAmved > 0 then
        begin
            res := UAmort_selection.ShowAm_Ved(pFIBDatabaseMestnaya.Handle, id_OstAmved, false);
            if VarArrayDimCount(res) > 0 then
            begin
                if (res[0]<>null) then
                begin
                    //
                end;
            end;
            close;
        end else
        begin
            ShowMessage(MAT_INV_You_must_sel_line);
        end;
end;

end.
