unit MainManHospRMoving;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeelPainters, cxDropDownEdit, cxCalendar,
  StdCtrls, cxButtons, cxTextEdit, cxMaskEdit, cxButtonEdit, cxLabel,
  cxContainer, cxEdit, cxCheckBox, ExtCtrls, cxControls, dxStatusBar,
  cxGridBandedTableView, cxClasses, cxStyles, cxGridTableView,
  cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxGridCustomView, cxGrid,
  dxBar, dxBarExtItems, ManHospRMoving_DM, PackageLoad, ZTypes, ActnList,uCommonSp,
  FIBDataSet, pFIBDataSet, ibase,ZProc,  Unit_Zglobal_consts;

type
  TfmMainManHospRMoving = class(TForm)
    dxStatusBar1: TdxStatusBar;
    dxStatusBar2: TdxStatusBar;
    PanelFilter: TPanel;
    PanelPeople: TPanel;
    PanelHosp: TPanel;
    WorkingBox: TcxCheckBox;
    FioFilterBox: TcxCheckBox;
    Label1: TcxLabel;
    DepartmentEdit: TcxButtonEdit;
    FioEdit: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxButton1: TcxButton;
    DateEdit: TcxDateEdit;
    Styles: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
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
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet;
    Grid1: TcxGrid;
    Grid1DBTableView1: TcxGridDBTableView;
    Grid1ClTn: TcxGridDBColumn;
    Grid1ClFIO: TcxGridDBColumn;
    Grid1Level1: TcxGridLevel;
    UseRusFio: TcxCheckBox;
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    AddManBtn: TdxBarLargeButton;
    DeleteBtn: TdxBarLargeButton;
    UpdateBtn: TdxBarLargeButton;
    InsertBtn: TdxBarLargeButton;
    DetailBtn: TdxBarLargeButton;
    LineViewBtn: TdxBarLargeButton;
    dxBarSubItem1: TdxBarSubItem;
    IndexChildHelpBtn: TdxBarLargeButton;
    PrintBtn: TdxBarLargeButton;
    AccBtn: TdxBarLargeButton;
    Grid3: TcxGrid;
    Grid3DBTableView1: TcxGridDBTableView;
    Grid3Seria: TcxGridDBColumn;
    Grid3Nomer: TcxGridDBColumn;
    Grid3DateBeg: TcxGridDBColumn;
    Grid3DateEnd: TcxGridDBColumn;
    Grid3Percent: TcxGridDBColumn;
    Grid3Primary: TcxGridDBColumn;
    Grid3Level1: TcxGridLevel;
    Grid3Ending: TcxGridDBColumn;
    actlst1: TActionList;
    act1: TAction;
    act2: TAction;
    SelBtn: TdxBarLargeButton;
    procedure cxButton1Click(Sender: TObject);
    procedure act1Execute(Sender: TObject);
    procedure act2Execute(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure DepartmentEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure InsertBtnClick(Sender: TObject);
    procedure UpdateBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DetailBtnClick(Sender: TObject);
    procedure SelBtnClick(Sender: TObject);
  private
   DM:TDM;
   PAOwner:TComponent;
   PLanguageIndex:byte;
   UseFilter: Boolean;
   ADb_handle  :TISC_DB_HANDLE;
   PDateBegAlg, PDateEndAlg : Tdate;
   TypeAlg  : Integer;
   Id_Filter_Department: Integer; // подразделение, по которому фильтровать
   procedure ApplyFilter;
  public
  PRes:Variant;
        constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);reintroduce;
  end;


implementation


{$R *.dfm}


constructor TfmMainManHospRMoving.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);
//var KodSetup:integer;
//    DBeg,DEnd:TDate;
begin
    inherited Create(AOwner);

    PLanguageIndex:=LanguageIndex;
    PAOwner       := Aowner;

    ADb_handle        := Db_Handle;

    DM := TDM.Create(self,Db_Handle);

    Grid1DBTableView1.DataController.DataSource := DM.DSource1;
    Grid3DBTableView1.DataController.DataSource := DM.DSource3;

    Caption                    := GetConst('Hospital',tcTabSheet);
    AddManBtn.Caption          := AddManBtn_Caption[PLanguageIndex];
    InsertBtn.Caption          := InsertBtn_Caption[PLanguageIndex];
    UpdateBtn.Caption          := UpdateBtn_Caption[PLanguageIndex];
    DeleteBtn.Caption          := DeleteBtn_Caption[PLanguageIndex];
    DetailBtn.Caption          := DetailBtn_Caption[PLanguageIndex];
    ExitBtn.Caption            := ExitBtn_Caption[PLanguageIndex];
    WorkingBox.Properties.Caption   := Show_working_Caption[PLanguageIndex];
    Label1.Caption                  := Filter_Department_Caption[PLanguageIndex];
    FioFilterBox.Properties.Caption := Filter_FIO_TN_Caption[PLanguageIndex];
    cxLabel1.Caption                := ON_date_Caption[PLanguageIndex];
    UseRusFio.Properties.Caption    := Filter_Rus_FIO_Caption[PLanguageIndex];
    Grid1ClTn.Caption               := GridClTn_Caption[PLanguageIndex];
    Grid1ClFIO.Caption              := GridClFIO_Caption[PLanguageIndex];


    UseFilter := False;


    DM.DSet2.Close;
    DM.DSet2.SQLs.SelectSQL.Text := 'SELECT Id_Department, Name_Full FROM Sp_Department D' +
        ' INNER JOIN Ini_Asup_Consts C ON D.Id_Department = C.Local_Department' +
        ' WHERE CURRENT_TIMESTAMP BETWEEN D.Use_Beg AND D.Use_End';
    DM.DSet2.Open;

    Id_Filter_Department := dm.DSet2['ID_DEPARTMENT'];
    DepartmentEdit.Text  := DM.DSet2['NAME_full'];
    WorkingBox.Checked   := True;
    DateEdit.Date        := Date;

    UseFilter := True;
    //ApplyFilter;

   // PRes:=NULL;
end;

procedure TfmMainManHospRMoving.ApplyFilter;
var
    TN_Filter: Integer;
    FIO_Filter: String;
begin
    if not UseFilter then Exit;

    if FioFilterBox.Checked then
    begin
        try
            TN_Filter := StrToInt(FioEdit.Text);
        except
            TN_Filter := -1;
        end;

        if TN_Filter = -1 then
            Fio_Filter := FioEdit.Text;
    end
    else
    begin
        Tn_Filter := -1;
        Fio_Filter := '';
    end;

    with DM.Dset1 do
    begin
        Close;
            SQLs.SelectSQL.Text:='SELECT FIO, Id_PCard, TN, Familia, Imya, ' +
            'Otchestvo, Id_Man, TIN FROM PCard_List_4(:Cur_Date, ' +
            ':Only_Working, :Id_Department, :TN_Filter, :Fio_Filter, ' +
            ':Type_Post_Filter, :Id_Level, :Show_Dropped_Workers, :Rus_Filter_FIO)';
        ParamByName('Cur_Date').AsDate := DateEdit.Date;
        if WorkingBox.Checked then
            ParamByName('Only_Working').AsInteger := 1
        else ParamByName('Only_Working').AsInteger := 0;
        ParamByName('Id_Department').AsInteger := Id_Filter_Department;
        ParamByName('Tn_Filter').AsInteger := Tn_Filter;
        ParamByName('Fio_Filter').AsString := Fio_Filter;

        if UseRusFio.Checked then ParamByName('Rus_Filter_Fio').AsInteger := 1;

        Open;
    end;
    DM.Dset1.First;

    DM.Dset3.Close;
    DM.DSet3.SQLs.SelectSQL.Text := 'SELECT * FROM MAN_HOSPITAL_SELECT(?ID_PCARD) ORDER BY DATE_BEG';
    DM.Dset3.Open;

   // NagScreen.Free;
    //FocusGrid;
end;

procedure TfmMainManHospRMoving.cxButton1Click(Sender: TObject);
begin
     ApplyFilter;
end;

procedure TfmMainManHospRMoving.act1Execute(Sender: TObject);
begin
     ApplyFilter;
end;

procedure TfmMainManHospRMoving.act2Execute(Sender: TObject);
begin
    ApplyFilter;
end;

procedure TfmMainManHospRMoving.ExitBtnClick(Sender: TObject);
begin
    close;
end;


procedure TfmMainManHospRMoving.FormResize(Sender: TObject);
var i :integer;
begin
   for i:=0 to dxStatusBar1.Panels.Count-1 do
   dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;
   for i:=0 to dxStatusBar2.Panels.Count-1 do
   dxStatusBar2.Panels[i].Width := dxStatusBar2.Width div dxStatusBar2.Panels.Count;
end;

procedure TfmMainManHospRMoving.DepartmentEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var sp: TSprav;
begin
    sp := GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(ADb_Handle);
            FieldValues['ShowStyle'] := 0;
            FieldValues['Select'] := 1;
            FieldValues['Actual_Date'] := DateEdit.Date;
            Post;
        end;
    end;
    sp.Show;
    if (sp.Output <> nil) or not sp.Output.IsEmpty then
    begin
         Id_Filter_Department := sp.Output['Id_Department'];
         DepartmentEdit.Text := sp.Output['Name_Full'];

         UseFilter := False;
         WorkingBox.Checked := True;
         UseFilter := True;
         ApplyFilter;

    end;
    sp.Free;
end;


procedure TfmMainManHospRMoving.InsertBtnClick(Sender: TObject);
var Parameter:THospRMovingParameter;
    Value:Variant;
begin
    if not dm.DSet1.IsEmpty then
    begin
        Parameter.AOwner:=self;
        Parameter.ADb_Handle:=Dm.DB.Handle;
        Parameter.AControlFormStyle:=zcfsInsert;
        Parameter.AId:=dm.DSet1['ID_MAN'];
        Parameter.AId_Pcard:=dm.DSet1['ID_PCARD'];

        Value:=LoadHospRMovingControl(Parameter);
        If Value<>NULL then
        begin
          DM.DSet3.CloseOpen(True);
          DM.DSet3.Locate('ID_man_hosp',Value,[loCaseInsensitive]);
        end;
    end;
end;

procedure TfmMainManHospRMoving.UpdateBtnClick(Sender: TObject);
var Parameter:THospRMovingParameter;
    Value:Variant;
begin
    if not dm.DSet1.IsEmpty then
    begin
        Parameter.AOwner:=self;
        Parameter.ADb_Handle:=Dm.DB.Handle;
        Parameter.AControlFormStyle:=zcfsUpdate;
        Parameter.AId:=dm.DSet1['ID_MAN'];
        Parameter.AId_Pcard:=dm.DSet1['ID_PCARD'];
        Parameter.AId_Hosp:=dm.DSet3['ID_MAN_HOSP'];


        Value:=LoadHospRMovingControl(Parameter);
        If Value<>NULL then
         begin
          DM.DSet3.CloseOpen(True);
          DM.DSet3.Locate('ID_man_hosp',Value,[loCaseInsensitive]);
         end;
   end;
end;

procedure TfmMainManHospRMoving.DeleteBtnClick(Sender: TObject);
var Parameter:THospRMovingParameter;
    Value:Variant;
begin
  if not dm.DSet1.IsEmpty and not dm.DSet3.IsEmpty then
  begin
    Parameter.AOwner:=self;
    Parameter.ADb_Handle:=DM.DB.Handle;
    Parameter.AControlFormStyle:=zcfsDelete;
    Parameter.AId:=dm.DSet1['ID_MAN'];
    Parameter.AId_Pcard:=dm.DSet1['ID_PCARD'];
    Parameter.AId_Hosp:=dm.DSet3['ID_MAN_HOSP'];

    Value:=LoadHospRMovingControl(Parameter);
    If Value<>NULL then
        DM.DSet3.CloseOpen(True);
  end;
end;


procedure TfmMainManHospRMoving.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if FormStyle=fsMDIChild then Action:=caFree;
end;

procedure TfmMainManHospRMoving.DetailBtnClick(Sender: TObject);
var Parameter:THospRMovingParameter;
    Value:Variant;
begin
    if not dm.DSet1.IsEmpty then
    begin
        Parameter.AOwner:=self;
        Parameter.ADb_Handle:=Dm.DB.Handle;
        Parameter.AControlFormStyle:=zcfsShowDetails;
        Parameter.AId:=dm.DSet1['ID_MAN'];
        Parameter.AId_Pcard:=dm.DSet1['ID_PCARD'];
        Parameter.AId_Hosp:=dm.DSet3['ID_MAN_HOSP'];


        Value:=LoadHospRMovingControl(Parameter);
        If Value<>NULL then
         begin
          DM.DSet3.CloseOpen(True);
          DM.DSet3.Locate('ID_man_hosp',Value,[loCaseInsensitive]);
         end;
   end;
end;

procedure TfmMainManHospRMoving.SelBtnClick(Sender: TObject);
var Hosp:Variant;
begin
     Pres := VarArrayCreate([0,9],varVariant);

    Pres[0] := DM.DSet3['Id_Man_Hosp'];
    Pres[1] := DM.DSet3['Date_Beg'];
    Pres[2] := DM.DSet3['Date_End'];
    Pres[3] := DM.DSet3['Seria'];
    Pres[4] := DM.DSet3['Nomer'];
    Pres[5] := DM.DSet1['Id_PCard'];
    Pres[6] := DM.DSet1['TN'];
    Pres[7] := DM.DSet1['FIO'];
    Pres[8] := Pres[7] + ', ' +Pres[3] + ' №' + Pres[4] + ' від "' +
            DateToStr(Pres[1]) + '"';
    Pres[9] := DM.DSet3['Ending'];

  self.ModalResult:=mrYes;
end;

end.
