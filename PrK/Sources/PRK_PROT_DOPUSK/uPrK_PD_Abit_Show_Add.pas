unit uPrK_PD_Abit_Show_Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, FIBDataSet, pFIBDataSet, ActnList, ImgList,
  dxBar, dxBarExtItems,AArray;

type
  TFormPrK_PD_Abit_Show_Add = class(TForm)
    ImageListPrk: TImageList;
    ActionListPrK: TActionList;
    ActionObnov: TAction;
    ActionOtmena: TAction;
    DataSourcePrKPZ_AbitShow_Add: TDataSource;
    DataSetPrKPZ_AbitShow_Add: TpFIBDataSet;
    cxGridPrKPZ_AbitShow_Add: TcxGrid;
    cxGridPrKPZ_AbitShow_AddDBTableView1: TcxGridDBTableView;
    colFIO: TcxGridDBColumn;
    colSHORT_NAME_FAK: TcxGridDBColumn;
    colSHORT_NAME_SPEC: TcxGridDBColumn;
    colSHORT_NAME_FORM_STUD: TcxGridDBColumn;
    cxGridPrKPZ_AbitShow_AddLevel1: TcxGridLevel;
    dxBarManagerPrk: TdxBarManager;
    dxBarLargeButtonObnov: TdxBarLargeButton;
    dxBarLargeButtonOtmena: TdxBarLargeButton;
    ActionVibrat: TAction;
    dxBarLargeButtonVibrat: TdxBarLargeButton;
    procedure ActionVibratExecute(Sender: TObject);
    procedure ActionObnovExecute(Sender: TObject);
    procedure ActionOtmenaExecute(Sender: TObject);
  private
    LangEdit :integer;
    DataPZAS :TAArray;
    FSelectSQLTextPZASAdd: String;
   procedure InicCaption;
    procedure SetSelectSQLTextPZASAdd(const Value: String);
  public
   constructor Create(aOwner: TComponent;aParam :TAArray);overload;
   Property SelectSQLTextPZASAdd :String read FSelectSQLTextPZASAdd write SetSelectSQLTextPZASAdd;
  end;

var
  FormPrK_PD_Abit_Show_Add: TFormPrK_PD_Abit_Show_Add;

implementation
uses
 uPrK_PROT_DOPUSK,uPrK_Resources,
 uConstants;
{$R *.dfm}

{ TFormPrK_PZ_Abit_Show_Add }

procedure TFormPrK_PD_Abit_Show_Add.InicCaption;
begin
    LangEdit :=SelectLanguage;

    dxBarManagerPrk.Bars[0].BorderStyle    :=bbsNone;
    dxBarManagerPrk.Bars[0].ShowMark       :=false;
    dxBarManagerPrk.CanCustomize           :=false;
    dxBarManagerPrk.Bars[0].AllowClose       :=false;
    dxBarManagerPrk.Bars[0].AllowCustomizing    :=false;
    dxBarManagerPrk.Bars[0].AllowQuickCustomizing  :=false;
    dxBarManagerPrk.Bars[0].AllowReset                :=false;

    cxGridPrKPZ_AbitShow_AddDBTableView1.Styles.Header     :=TFormPrK_PROT_DOPUSK(Self.Owner.Owner).cxStyleHeader;
    cxGridPrKPZ_AbitShow_AddDBTableView1.Styles.Background :=TFormPrK_PROT_DOPUSK(Self.Owner.Owner).cxStyleBackGround_Content;
    cxGridPrKPZ_AbitShow_AddDBTableView1.Styles.Content    :=TFormPrK_PROT_DOPUSK(Self.Owner.Owner).cxStyleBackGround_Content;
    cxGridPrKPZ_AbitShow_AddDBTableView1.Styles.Selection  :=TFormPrK_PROT_DOPUSK(Self.Owner.Owner).cxStyleSelection;
    cxGridPrKPZ_AbitShow_AddDBTableView1.Styles.Inactive   :=TFormPrK_PROT_DOPUSK(Self.Owner.Owner).cxStyleInactive;

    ActionVibrat.Caption                 :=nAction_Vibrat[LangEdit];
    ActionObnov.Caption                  :=nActiont_Obnov[LangEdit];
    ActionOtmena.Caption                 :=nAction_Exit[LangEdit];

    ActionVibrat.Hint                    :=nHintAction_Vibrat[LangEdit];
    ActionObnov.Hint                     :=nHintAction_Obnov[LangEdit];
    ActionOtmena.Hint                    :=nHintAction_Exit[LangEdit];

    colFIO.Caption                         :=ncolFIO[LangEdit];
    colSHORT_NAME_FAK.Caption              :=ncolNAME_FAK[LangEdit];
    colSHORT_NAME_SPEC.Caption             :=ncolNAME_SPEC[LangEdit];
    colSHORT_NAME_FORM_STUD.Caption        :=ncolSHORT_NAME_CN_FORM_STUD[LangEdit];
end;

procedure TFormPrK_PD_Abit_Show_Add.ActionVibratExecute(Sender: TObject);
begin
   if DataSetPrKPZ_AbitShow_Add.FieldValues['ID_DT_ABIT']<>null
    then  ModalResult:=MrOK;
end;

procedure TFormPrK_PD_Abit_Show_Add.ActionObnovExecute(Sender: TObject);
Var
  id_Obnov: Int64;
begin
  if DataSetPrKPZ_AbitShow_Add.FieldValues['ID_DT_ABIT']<>Null
   then id_Obnov:=DataSetPrKPZ_AbitShow_Add.FieldValues['ID_DT_ABIT']
   else id_Obnov:=-1;
  DataSetPrKPZ_AbitShow_Add.CloseOpen(false);
  DataSetPrKPZ_AbitShow_Add.Locate('ID_DT_ABIT',id_Obnov,[]);
end;

procedure TFormPrK_PD_Abit_Show_Add.ActionOtmenaExecute(Sender: TObject);
begin
   close;
end;

constructor TFormPrK_PD_Abit_Show_Add.Create(aOwner: TComponent;
  aParam: TAArray);
begin
  inherited Create(aOwner);
  InicCaption;
  DataPZAS:= aParam;
  SelectSQLTextPZASAdd := DataPZAS['SelectSQL_Text'].AsString;
end;

procedure TFormPrK_PD_Abit_Show_Add.SetSelectSQLTextPZASAdd(
  const Value: String);
begin
  FSelectSQLTextPZASAdd := Value;
    DataSetPrKPZ_AbitShow_Add.Active                      :=false;
    DataSetPrKPZ_AbitShow_Add.Database                    :=TFormPrK_PROT_DOPUSK(self.Owner.Owner).DataBasePrk;
    DataSetPrKPZ_AbitShow_Add.Transaction                 :=TFormPrK_PROT_DOPUSK(self.Owner.Owner).TransactionReadPrK;
    DataSetPrKPZ_AbitShow_Add.SelectSQL.Clear;
    DataSetPrKPZ_AbitShow_Add.SQLs.SelectSQL.Text         :=FSelectSQLTextPZASAdd;
    DataSetPrKPZ_AbitShow_Add.ParamByName('ID_SP_GOD_NABORA').AsInt64               :=TFormPrK_PROT_DOPUSK(self.Owner.Owner).ID_GOD_NABORA_GLOBAL;
    DataSetPrKPZ_AbitShow_Add.CloseOpen(false);
end;

end.
