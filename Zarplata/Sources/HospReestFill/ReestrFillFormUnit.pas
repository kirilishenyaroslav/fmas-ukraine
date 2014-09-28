unit ReestrFillFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ExtCtrls, StdCtrls, IBCustomDataSet, IBQuery,
  PersonalCommon, IBStoredProc, Menus,GoodFunctionsUnit,DepartmentsViewUnit,
  Buttons, cxLookAndFeelPainters, cxButtons, cxButtonEdit,EditHosp,SpCommon,
  TestFrameUnit, cxCurrencyEdit;
  

type
  TReestrFillForm = class(TForm)
    cxStyleRepository1: TcxStyleRepository;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
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
    GridTableViewStyleSheetEggplant: TcxGridTableViewStyleSheet;
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
    RepHospGridDBTV: TcxGridDBTableView;
    RepHospGridLevel1: TcxGridLevel;
    RepHospGrid: TcxGrid;
    cxStyle26: TcxStyle;
    Label1: TLabel;
    HospListDataSource: TDataSource;
    HospListQuery: TIBQuery;
    HospListQueryDATE_BEG: TDateField;
    HospListQueryDATE_END: TDateField;
    HospListQuerySERIA: TIBStringField;
    HospListQueryNOMER: TIBStringField;
    HospListQueryFAMILIA: TIBStringField;
    HospListQueryTN: TIntegerField;
    AddHospToReestrProc: TIBStoredProc;
    HospListQueryID_HOSP: TIntegerField;
    ListSource: TDataSource;
    ListQuery: TIBQuery;
    ListQueryID_HOSP: TIntegerField;
    ListQueryDATE_BEG: TDateField;
    ListQueryDATE_END: TDateField;
    ListQuerySERIA: TIBStringField;
    ListQueryNOMER: TIBStringField;
    ListQueryFAMILIA: TIBStringField;
    ListQueryTN: TIntegerField;
    RepHospGridDBTVDATE_BEG: TcxGridDBColumn;
    RepHospGridDBTVDATE_END: TcxGridDBColumn;
    RepHospGridDBTVSERIA: TcxGridDBColumn;
    RepHospGridDBTVNOMER: TcxGridDBColumn;
    RepHospGridDBTVFAMILIA: TcxGridDBColumn;
    RepHospGridDBTVTN: TcxGridDBColumn;
    DelHospFromReestrProc: TIBStoredProc;
    PopupMenu: TPopupMenu;
    AddAllItem: TMenuItem;
    RemoveAllItem: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    HospListGrid: TcxGrid;
    HospListGridDBTV: TcxGridDBTableView;
    HospListGridDBTVTN: TcxGridDBColumn;
    HospListGridDBTVFAMILIA: TcxGridDBColumn;
    HospListGridDBTVDATE_BEG: TcxGridDBColumn;
    HospListGridDBTVDATE_END: TcxGridDBColumn;
    HospListGridDBTVSERIA: TcxGridDBColumn;
    HospListGridDBTVNOMER: TcxGridDBColumn;
    HospListGridLevel1: TcxGridLevel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DepartmentEdit: TEdit;
    DepartmentButton: TBitBtn;
    IllTypeBox: TComboBox;
    Panel4: TPanel;
    DetailsButton: TSpeedButton;
    HospListQueryID_PCARD: TIntegerField;
    SetFilterButton: TSpeedButton;
    RemoveFilterButton: TSpeedButton;
    ListQueryPERCENT: TIBBCDField;
    cxStyle27: TcxStyle;
    HospListQueryPERCENT: TIBBCDField;
    HospListGridDBTVPERCENT: TcxGridDBColumn;
    Panel5: TPanel;
    Splitter1: TSplitter;
    Label5: TLabel;
    NumHosps: TLabel;
    Label6: TLabel;
    NumHospReestrLabel: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure HospListGridDBTVDblClick(Sender: TObject);
    procedure AddAllItemClick(Sender: TObject);
    procedure RepHospGridDBTVDblClick(Sender: TObject);
    procedure RemoveAllItemClick(Sender: TObject);
    procedure DepartmentButtonClick(Sender: TObject);
    procedure SetFilterButtonClick(Sender: TObject);
    procedure RemoveFilterButtonClick(Sender: TObject);
    procedure IllTypeBoxChange(Sender: TObject);
    procedure DetailsButtonClick(Sender: TObject);
  private
   Procedure AddToList(IdHosp:Integer;DoRefresh:Boolean=True);
   procedure RemoveFromList(IdHosp:Integer);
   procedure RefreshHospList;
   procedure AddZeroPercentHosps;


  public
    Procedure Prepare(IdReestr:Integer);
  end;

var
  ReestrFillForm: TReestrFillForm;
  Id_Reestr:Integer;
  Id_FilterDepartment:Integer;
  Id_Type:Integer;
implementation

{$R *.dfm}
procedure TReestrFillForm.AddZeroPercentHosps;
begin
    HospListQuery.First;
    while (not HospListQuery.Eof) do
        begin
            if HospListQuery['Percent']=0 then AddToList(HospListQuery['ID_HOSP'],False);
            HospListQuery.Next;
            Application.ProcessMessages;
        end;

end;

procedure TReestrFillForm.RefreshHospList;
var
n:Integer;
begin
    
    HospListQuery.Close;
    HospListQuery.ParamByName('ID_DEP').Value:=Id_FilterDepartment;
  if (Id_Type<>-1) then HospListQuery.ParamByName('ID_TYPE').Value:=Id_Type
    else  HospListQuery.ParamByName('ID_TYPE').Value:=Null;
    HospListQuery.Open;
    HospListQuery.Last;
    n:=HospListQuery.RecordCount;
    HospListQuery.First;
    NumHosps.Caption:=IntToStr(n);


end;


procedure TReestrFillForm.RemoveFromList(IdHosp:Integer);
var
n:Integer;
begin
    DelHospFromReestrProc.ParamByName('Id_Reestr').Value:=Id_Reestr;
    DelHospFromReestrProc.ParamByName('Id_Hosp').Value:=IdHosp;
    PersonalCommon.WriteTransaction.StartTransaction;
    DelHospFromReestrProc.ExecProc;
    PersonalCommon.WriteTransaction.Commit;

    ListQuery.Close;
    ListQuery.ParamByName('ID_REESTR').Value:=Id_Reestr;
    ListQuery.Open;

    ListQuery.Last;
    n:=ListQuery.RecordCount;
    NumHospReestrLabel.Caption:=IntToStr(n);
    ListQuery.First;


end;


procedure TReestrFillForm.AddToList(IdHosp:Integer;DoRefresh:Boolean=True);
var
n:Integer;
begin

    AddHospToReestrProc.ParamByName('Id_Reestr').Value:=Id_Reestr;
    AddHospToReestrProc.ParamByName('Id_Hosp').Value:=IdHosp;
  PersonalCommon.WriteTransaction.StartTransaction;
    AddHospToReestrProc.ExecProc;
  PersonalCommon.WriteTransaction.Commit;

    ListQuery.Close;
    ListQuery.ParamByName('ID_REESTR').Value:=Id_Reestr;
    ListQuery.Open;

    ListQuery.Last;
    n:=ListQuery.RecordCount;
    NumHospReestrLabel.Caption:=IntToStr(n);
    ListQuery.First;


if DoRefresh then    RefreshHospList;

end;


procedure TReestrFillForm.Prepare(IdReestr:Integer);
begin
    Id_Reestr:=IdReestr;
    ListQuery.ParamByName('ID_REESTR').Value:=Id_Reestr;
    ListQuery.Open;

  //  AddZeroPercentHosps;

end;

procedure TReestrFillForm.FormCreate(Sender: TObject);
begin
    HospListQuery.Transaction:=PersonalCommon.ReadTransaction;
    AddHospToReestrProc.Transaction:=PersonalCommon.WriteTransaction;
    ListQuery.Transaction:=PersonalCommon.ReadTransaction;
    DelHospFromReestrProc.Transaction:=PersonalCommon.WriteTransaction;

    Id_FilterDepartment:=-1;
    Id_Type:=-1;



    RefreshHospList;


end;

procedure TReestrFillForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action:=caFree;
end;

procedure TReestrFillForm.HospListGridDBTVDblClick(Sender: TObject);
begin
       AddToList(HospListQuery['Id_Hosp']);
end;
procedure TReestrFillForm.AddAllItemClick(Sender: TObject);
var
i,c:integer;
begin
   HospListQuery.Last;
   c:=HospListQuery.RecordCount;
   HospListQuery.First;

   for i:=1 to c do
   begin
         AddToList(HospListQuery['Id_Hosp'],False);
         HospListQuery.Next;
         Application.ProcessMessages;
   end;


   RefreshHospList;

end;

procedure TReestrFillForm.RepHospGridDBTVDblClick(Sender: TObject);
begin

  if (not ListQuery.IsEmpty) then
    begin
        RemoveFromList(ListQuery['Id_Hosp']);
        RefreshHospList;
    end;
        
end;

procedure TReestrFillForm.RemoveAllItemClick(Sender: TObject);
begin
    ListQuery.First;
    While(not ListQuery.IsEmpty) do
    begin
        RemoveFromList(ListQuery['Id_Hosp']);
        Application.ProcessMessages;

    end;
    RefreshHospList;
end;

procedure TReestrFillForm.DepartmentButtonClick(Sender: TObject);
var
	form: TDepartmentsViewForm;
begin
	form := TDepartmentsViewForm.Create(Self);
  form.Buhg:=False;
  form.Prepare(True, Date());
  form.CanSelectRoot := True;
  if form.ShowModal = mrOk then
	with form do
	begin
		Id_FilterDepartment := Selected_Id;
		if Id_FilterDepartment = -1 then
			DepartmentEdit.Text := Consts_Query['Firm_Name']
		else	DepartmentEdit.Text := ResultQuery['Name_Short'];
	end;
	form.Free;

end;

procedure TReestrFillForm.SetFilterButtonClick(Sender: TObject);
begin
    RefreshHospList;
end;

procedure TReestrFillForm.RemoveFilterButtonClick(Sender: TObject);
begin
    DepartmentEdit.Text:='';
    Id_FilterDepartment:=-1;
    Id_Type:=-1;
    RefreshHospList;
    
end;

procedure TReestrFillForm.IllTypeBoxChange(Sender: TObject);
begin
    Id_Type:=IllTypeBox.ItemIndex+1;
end;

procedure TReestrFillForm.DetailsButtonClick(Sender: TObject);
var
       form:TEditHospForm;
begin
 if not HospListQuery.IsEmpty then
   begin
     form:=TEditHospForm.Create(Self);
     form.IDPCARD:=HospListQuery['ID_PCARD'];
     form.Prepare(emView,HospListQuery['ID_HOSP']);
     form.ShowModal;

    end;
end;


end.
