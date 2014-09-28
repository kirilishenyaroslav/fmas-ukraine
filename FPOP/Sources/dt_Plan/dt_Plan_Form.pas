{******************************************************************************}
{               Автоматизированная система «Формирование планов основного      }
{                          производства ГПП «Укрпромводчермет»                 }
{               (c) Донецкий национальный университет, 2002-2006               }
{******************************************************************************}

{                Модуль "Реестр планов основного производства"                 }
{  Отображение планов в разрезе подразделений и периодов, изменение и удаление }
{  планов, выбор плана для редактирования данных в Редакторе планов            }
{                                               ответственный: Андрей Таганский}

unit dt_Plan_Form;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDataSet, pFIBDataSet,
  Buttons, ToolWin, ComCtrls, tagBaseTypes, IniFiles, tagSys_Options, ActnList,
  StdCtrls, AppEvnts, cxInplaceContainer, cxTL, cxDBTL, cxControls, cxTLData,
  cxGraphics, cxCustomData, cxStyles, cxTextEdit, cxMemo, cxCheckBox,
  cxCalendar, cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit, ExtCtrls,
  cxSpinEdit, dxBar, dxBarExtItems, cxCurrencyEdit, cxCalc;

const
 WM_TRAY_ICON   = WM_USER + 1024;
type
  Tdt_Plan_Form1 = class(TForm)
    StoredProc: TpFIBStoredProc;
    ActionList: TActionList;
    ActionMod: TAction;
    ActionDel: TAction;
    ActionAdd: TAction;
    ActionSel: TAction;
    ActionRefresh: TAction;
    TabPage: TPageControl;
    byDepartmentSheet: TTabSheet;
    byStagesSheet: TTabSheet;
    Query: TpFIBQuery;
    ActionExit: TAction;
    PopupMenu: TPopupMenu;
    pAddButton: TMenuItem;
    pEditNameButton: TMenuItem;
    pEditButton: TMenuItem;
    pDelButton: TMenuItem;
    pRefreshButton: TMenuItem;
    N2: TMenuItem;
    DepartmentTreeList: TcxTreeList;
    id_Department_Column1: TcxTreeListColumn;
    id_Plan_Column1: TcxTreeListColumn;
    Name_Column1: TcxTreeListColumn;
    Date_Beg_Column1: TcxTreeListColumn;
    Date_End_Column1: TcxTreeListColumn;
    is_it_Changed_Column1: TcxTreeListColumn;
    Main_Plan_Column1: TcxTreeListColumn;
    StagesTreeList: TcxTreeList;
    id_Plan_Column2: TcxTreeListColumn;
    id_Department_Column2: TcxTreeListColumn;
    Name_Column2: TcxTreeListColumn;
    Date_Beg_Column2: TcxTreeListColumn;
    Date_End_Column2: TcxTreeListColumn;
    Name_Department_Column2: TcxTreeListColumn;
    Datebeg: TcxTreeListColumn;
    Dateend: TcxTreeListColumn;
    is_it_Changed_Column2: TcxTreeListColumn;
    Main_Plan_Column2: TcxTreeListColumn;
    id_Plan_Type_Column1: TcxTreeListColumn;
    id_Plan_Type_Column2: TcxTreeListColumn;
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    DelButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    CloseButton: TdxBarLargeButton;
    EditNameButton: TdxBarLargeButton;
    Panel2: TPanel;
    SetFilter: TcxCheckBox;
    FilterYearEnd: TcxSpinEdit;
    Label3: TLabel;
    FilterYearBeg: TcxSpinEdit;
    Label2: TLabel;
    Label1: TLabel;
    procedure AddButtonClick(Sender: TObject);
    procedure EditNameButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ActionModExecute(Sender: TObject);
    procedure ActionDelExecute(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionSelExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure RefreshDepartment(id_Department, id_Plan_Type, id_Plan, index : integer; SelPlans : boolean);
    procedure RefreshStages(Date_Beg, Date_End : TDate; id_Plan_Type, id_Plan, Index : integer; SelPlans : boolean);
    procedure FormShow(Sender: TObject);
    procedure SelectPlans;
    procedure DepartmentTreeListDblClick(Sender: TObject);
    procedure StagesTreeListDblClick(Sender: TObject);
    procedure TabPageChange(Sender: TObject);
    procedure ActionExitExecute(Sender: TObject);
    procedure SetFilterClick(Sender: TObject);
    procedure FilterYearBegPropertiesEditValueChanged(Sender: TObject);
    procedure DepartmentTreeListCustomDrawCell(Sender: TObject;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
      var ADone: Boolean);
    procedure StagesTreeListCustomDrawCell(Sender: TObject;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
      var ADone: Boolean);
  private
    { Private declarations }
  public
   destructor Destroy; override;
  end;

var
  dt_Plan_Form1 : Tdt_Plan_Form1;
  Options       : TSpravOptions;
implementation

uses dt_Plan_Add, DataModule, PlanEditor, TagLib, ShellAPI, cxFormats;

{$R *.DFM}

destructor Tdt_Plan_Form1.Destroy;
begin
 dt_Plan_Form1 := nil;
 inherited;
end;

procedure Tdt_Plan_Form1.SelectPlans;
var
 id_Department   : integer;
 Name_Department : string;
 id_Plan_Type    : integer;
 Name_Plan_Type  : string;
 id_Plan         : integer;
 Name_Plan       : string;
 Date_Beg        : TDateTime;
 Date_End        : TDateTime;
 is_it_Changed   : boolean;
 is_it_Main      : boolean;

 i, j, k, l      : integer;
 f, n            : integer;
 Node, Node1     : TcxTreeListNode;
 Child           : TcxTreeListNode;
 Child2          : TcxTreeListNode;
 Flag            : boolean;
begin
 DepartmentTreeList.Clear;
 StagesTreeList.Clear;

 if SetFilter.Checked then
  Query.SQL.Text := 'select * from PROC_DT_PLANS_SEL(-1) where DATE_BEG_PARAM>='
  + #39 + DateToStr(EncodeDate(FilterYearBeg.Value, 1, 1)) + #39 + ' and DATE_END_PARAM<='
  + #39 + DateToStr(EncodeDate(FilterYearEnd.Value, 12, 31)) + #39
 else
  Query.SQL.Text := 'select * from PROC_DT_PLANS_SEL(-1)';

 Query.ExecQuery;
 if Query.RecordCount = 0 then begin
  Query.Close;
  Exit;
 end;

 while not Query.Eof do begin
  id_Department   := Query['id_Department_Param'].AsInteger;
  Name_Department := Query['Name_Department_Param'].AsString;
  id_Plan_Type    := Query['id_Plan_Type_Param'].AsInteger;
  Name_Plan_Type  := Query['Name_Plan_Type_Param'].AsString;
  id_Plan         := Query['id_Plan_Param'].AsInteger;
  Name_Plan       := Query['Name_Plan_Param'].AsString;
  Date_Beg        := Query['Date_Beg_Param'].AsDate;
  Date_End        := Query['Date_End_Param'].AsDate;
  is_it_Changed   := (Query['is_it_changed_param'].AsInteger =  1);
  is_it_Main      := (2612 = Query['id_Department_Param'].AsInteger);

// Filling of DepartmentTreeList by Year Plans

  Flag := True;

  for i := 0 to DepartmentTreeList.Count - 1 do
   if DepartmentTreeList.Items[i].Values[0] = id_Department then begin
    Node := DepartmentTreeList.Items[i];
    Flag := False;
    Break;
   end;


  if Flag then begin
   Node           := DepartmentTreeList.Add;
   Node.Values[0] := id_Department;
   Node.Values[2] := Name_Department;
  end;

  Flag := True;

  for i := 0 to Node.Count - 1 do
   if Node.Items[i].Values[7] = id_Plan_Type then begin
    Child := Node.Items[i];
    Flag  := False;
    Break;
   end;

  if Flag then begin
   Child           := Node.AddChild;
   Child.Values[7] := id_Plan_Type;
   Child.Values[2] := Name_Plan_Type;
  end;

  Child2 := Child.AddChild;

  Child2.Values[1] := id_PLan;
  Child2.Values[2] := Name_Plan;
  Child2.Values[3] := Date_Beg;
  Child2.Values[4] := Date_End;
  Child2.Values[5] := is_it_Changed;
  Child2.Values[6] := is_it_Main;
  Child2.Values[7] := id_Plan_Type;

// Filling of StagesTreeList by Year Plans

  Flag := True;
  for i := 0 to StagesTreeList.Count - 1 do
   if (StrToDate(StagesTreeList.Items[i].Values[6]) = Date_Beg)
   and (StrToDate(StagesTreeList.Items[i].Values[7]) = Date_End) then begin
    Node := StagesTreeList.Items[i];
    Flag := False;
    Break;
   end;

  if Flag then begin
   Node           := StagesTreeList.Add;
   Node.Values[2] := GetPeriodName(Date_Beg, Date_End, True);
   Node.Values[6] := Date_Beg;
   Node.Values[7] := Date_End;
  end;

  Flag := True;
  for i := 0 to Node.Count - 1 do
   if Node.Items[i].Values[10] = id_Plan_Type then begin
    Child := Node.Items[i];
    Flag  := False;
    Break;
   end;

  if Flag then begin
   Child            := Node.AddChild;
   Child.Values[10] := id_Plan_Type;
   Child.Values[2]  := Name_Plan_Type;
  end;

  Child2 := Child.AddChild;

  Child2.Values[0] := id_PLan;
  Child2.Values[1] := id_Department;
  Child2.Values[2] := Name_Plan;
  Child2.Values[3] := Date_Beg;
  Child2.Values[4] := Date_End;
  Child2.Values[5] := Name_Department;
  Child2.Values[8] := is_it_Changed;
  Child2.Values[9] := is_it_Main;
  Child2.Values[10]:= id_Plan_Type;

  Query.Next;
 end;

 Query.Close;

 // Filling of DepartmentTreeList and StagesTreeList
 for i := 0 to DepartmentTreeList.Count - 1 do begin
  if DepartmentTreeList.Items[i].Count = 0 then Continue;
  for j := 0 to DepartmentTreeList.Items[i].Count - 1 do begin
   for f := 0 to DepartmentTreeList.Items[i].Items[j].Count - 1 do begin
    Node := DepartmentTreeList.Items[i].Items[j].Items[f];
    Query.SQL.Text := 'select * from PROC_DT_PLANS_SEL(' +
    IntToStr(Node.Values[1]) + ')';
    Query.ExecQuery;
    if Query.RecordCount = 0 then begin
     Query.Close;
     Continue;
    end;

    while not Query.Eof do begin
     id_Department   := Query['id_Department_Param'].AsInteger;
     Name_Department := Query['Name_Department_Param'].AsString;
     id_Plan         := Query['id_Plan_Param'].AsInteger;
     Name_Plan       := Query['Name_Plan_Param'].AsString;
     Date_Beg        := Query['Date_Beg_Param'].AsDate;
     Date_End        := Query['Date_End_Param'].AsDate;
     is_it_Main      := (2612 = Query['id_Department_Param'].AsInteger);
     id_Plan_Type    := Node.Values[7];


     // Filling of DepartmentTreeList
     Child := Node.AddChild;

     Child.Values[1] := id_PLan;
     Child.Values[2] := Name_Plan;
     Child.Values[3] := Date_Beg;
     Child.Values[4] := Date_End;
     Child.Values[6] := is_it_Main;
     Child.Values[7] := id_Plan_Type;

     // Filling of StagesTreeList
     for k := 0 to StagesTreeList.Count - 1 do begin
      if (StagesTreeList.Items[k].Values[6] <> Node.Values[3]) or (StagesTreeList.Items[k].Values[7] <> Node.Values[4]) then Continue;

      for l := 0 to StagesTreeList.Items[k].Count - 1 do begin
       if StagesTreeList.Items[k].Items[l].Values[10] <> Node.Values[7] then Continue;

       for n := 0 to StagesTreeList.Items[k].Items[l].Count - 1 do begin
        if StagesTreeList.Items[k].Items[l].Items[n].Values[0] <> Node.Values[1] then Continue;

        Node1 := StagesTreeList.Items[k].Items[l].Items[n];

        Child := Node1.AddChild;

        Child.Values[0] := id_Plan;
        Child.Values[1] := id_Department;
        Child.Values[2] := Name_Plan;
        Child.Values[3] := Date_Beg;
        Child.Values[4] := Date_End;
        Child.Values[5] := Name_Department;
        Child.Values[9] := is_it_Main;
        Child.Values[10]:= id_Plan_Type;
       end;
      end;
     end;
     Query.Next;
    end;
    Query.Close;
   end;
  end;
 end;
end;

procedure Tdt_Plan_Form1.RefreshDepartment(id_Department, id_Plan_Type, id_Plan, index : integer; SelPlans : boolean);
var
 i, j, k, t : integer;
 Flag       : boolean;
begin
 if SelPlans then SelectPlans;

 if DepartmentTreeList.Count = 0 then Exit;

 if index < 0 then begin
  if id_Department < 0 then Exit;

  Flag := False;
  for i := 0 to DepartmentTreeList.Count - 1 do
   if DepartmentTreeList.Items[i].Values[0] = id_Department then begin
    Flag := True;
    Break;
   end;

  if not Flag then Exit;

  if id_Plan_Type < 0 then begin
   DepartmentTreeList.Items[i].Focused := True;
   Exit;
  end;

  Flag := False;
  for t := 0 to DepartmentTreeList.Items[i].Count - 1 do
   if DepartmentTreeList.Items[i].Items[t].Values[7] = id_Plan_Type then begin
    Flag := True;
    Break;
   end;

  if not Flag then Exit;

  if id_Plan < 0 then begin
   DepartmentTreeList.Items[i].Items[t].Focused := True;
   Exit;
  end;

  for j := 0 to DepartmentTreeList.Items[i].Items[t].Count - 1 do
   if DepartmentTreeList.Items[i].Items[t].Items[j].Values[1] = id_Plan
   then begin
    DepartmentTreeList.Items[i].Items[t].Items[j].Focused := True;
    Break;
   end
   else begin
    if DepartmentTreeList.Items[i].Items[t].Items[j].Count = 0 then Continue;
    for k := 0 to DepartmentTreeList.Items[i].Items[t].Items[j].Count - 1 do
    if DepartmentTreeList.Items[i].Items[t].Items[j].Items[k].Values[1] = id_Plan
    then begin
     DepartmentTreeList.Items[i].Items[t].Items[j].Items[k].Focused := True;
     Break;
    end;
   end;
 end
 else begin
  if DepartmentTreeList.Nodes.AbsoluteItems[Index - 1] <> nil then
   DepartmentTreeList.Nodes.AbsoluteItems[Index - 1].Focused := True
  else if DepartmentTreeList.Nodes.AbsoluteItems[Index] <> nil then
   DepartmentTreeList.Nodes.AbsoluteItems[Index].Focused := True
  else if DepartmentTreeList.Nodes.AbsoluteItems[Index + 1] <> nil then
   DepartmentTreeList.Nodes.AbsoluteItems[Index + 1].Focused := True;
 end;
end;

procedure Tdt_Plan_Form1.RefreshStages(Date_Beg, Date_End : TDate; id_Plan_Type, id_Plan, Index : integer; SelPlans : boolean);
var
 i, j, k, t : integer;
 Flag       : boolean;
begin
 if SelPlans then SelectPlans;

 if StagesTreeList.Count = 0 then Exit;

 if Index < 0 then begin
  if (Date_Beg = 0) or (Date_End = 0) then Exit;
  Flag := False;
  for i := 0 to StagesTreeList.Count - 1 do
   if (StrToDate(StagesTreeList.Items[i].Values[6]) = Date_Beg) and (StrToDate(StagesTreeList.Items[i].Values[7]) = Date_End)
   then begin
    Flag := True;
    Break;
   end;

  if not Flag then Exit;

  if id_Plan_Type < 0 then begin
   StagesTreeList.Items[i].Focused := True;
   Exit;
  end;

  Flag := False;
  for t := 0 to StagesTreeList.Items[i].Count - 1 do
   if StagesTreeList.Items[i].Items[t].Values[10] = id_Plan_Type then begin
    Flag := True;
    Break;
   end;

  if not Flag then Exit; 

  if id_Plan < 0 then begin
   StagesTreeList.Items[i].Items[t].Focused := True;
   Exit;
  end;

  for j := 0 to StagesTreeList.Items[i].Items[t].Count - 1 do
   if StagesTreeList.Items[i].Items[t].Items[j].Values[0] = id_Plan
   then begin
    StagesTreeList.Items[i].Items[t].Items[j].Focused := True;
    Break;
   end
   else begin
    if StagesTreeList.Items[i].Items[t].Items[j].Count = 0 then Continue;
    for k := 0 to StagesTreeList.Items[i].Items[t].Items[j].Count - 1 do
     if StagesTreeList.Items[i].Items[t].Items[j].Items[k].Values[0] = id_Plan then begin
      StagesTreeList.Items[i].Items[t].Items[j].Items[k].Focused := True;
      Break;
     end;
   end;
 end
 else StagesTreeList.Nodes.AbsoluteItems[Index].Focused := True;
end;

procedure Tdt_Plan_Form1.AddButtonClick(Sender: TObject);
var
 Name_Plan     : string;
 id_Plan_Type  : integer;
 id_Department : integer;
 Date_Beg      : TDate;
 Date_End      : TDate;
 Link_Plan_To  : integer;
begin
 if dt_Plan_Add_Form1 <> nil then Exit;
 Application.CreateForm(Tdt_Plan_Add_Form1, dt_Plan_Add_Form1);
 dt_Plan_Add_Form1.Caption := 'Додавання плану';

 if TabPage.ActivePageIndex = 0 then begin
  if DepartmentTreeList.FocusedNode = nil then begin
   dt_Plan_Add_Form1.PlanKindRadioGroup.Enabled   := False;
   dt_Plan_Add_Form1.Date_Beg.Date                := Now;

   dt_Plan_Add_Form1.PlanKindRadioGroup.ItemIndex := 0;
  end
  else begin
   case DepartmentTreeList.FocusedNode.Level of
   0 :
    begin
     dt_Plan_Add_Form1.PlanKindRadioGroup.Enabled   := False;
     dt_Plan_Add.Link_Name_Depart                   := DepartmentTreeList.FocusedNode.Values[2];
     dt_Plan_Add.Link_id_Depart                     := DepartmentTreeList.FocusedNode.Values[0];
     dt_Plan_Add_Form1.Date_Beg.Date                := Now;

     dt_Plan_Add_Form1.PlanKindRadioGroup.ItemIndex := 0;
    end;
   1 :
    begin
     dt_Plan_Add_Form1.PlanKindRadioGroup.Enabled   := False;
     dt_Plan_Add.Link_Name_Depart                   := DepartmentTreeList.FocusedNode.Parent.Values[2];
     dt_Plan_Add.Link_id_Depart                     := DepartmentTreeList.FocusedNode.Parent.Values[0];
     dt_Plan_Add_Form1.Date_Beg.Date                := Now;
     dt_Plan_Add.NamePlanType                       := DepartmentTreeList.FocusedNode.Values[2];
     dt_Plan_Add.id_Plan_Type                       := DepartmentTreeList.FocusedNode.Values[7];

     dt_Plan_Add_Form1.PlanKindRadioGroup.ItemIndex := 0;
    end;
   2 :
    begin
     dt_Plan_Add.Link_Name_Plan            := DepartmentTreeList.FocusedNode.Values[2];
     dt_Plan_Add.Link_Name_Depart          := DepartmentTreeList.FocusedNode.Parent.Parent.Values[2];
     dt_Plan_Add.Link_id_Depart            := DepartmentTreeList.FocusedNode.Parent.Parent.Values[0];
     dt_Plan_Add.LinkNamePlanType          := DepartmentTreeList.FocusedNode.Parent.Values[2];
     dt_Plan_Add.NamePlanType              := DepartmentTreeList.FocusedNode.Parent.Values[2];
     dt_Plan_Add.id_Plan_Type              := DepartmentTreeList.FocusedNode.Parent.Values[7];

     dt_Plan_Add.Date_Beg_Limit            := StrToDate(DepartmentTreeList.FocusedNode.Values[3]);
     dt_Plan_Add.Date_End_Limit            := StrToDate(DepartmentTreeList.FocusedNode.Values[4]);
     dt_Plan_Add_Form1.Date_Beg.Date       := Now;

     dt_Plan_Add_Form1.PlanKindRadioGroup.ItemIndex := 1;
    end;
   3 :
    begin
     dt_Plan_Add.Link_Name_Plan   := DepartmentTreeList.FocusedNode.Parent.Values[2];
     dt_Plan_Add.Link_Name_Depart := DepartmentTreeList.FocusedNode.Parent.Parent.Parent.Values[2];
     dt_Plan_Add.Link_id_Depart   := DepartmentTreeList.FocusedNode.Parent.Parent.Parent.Values[0];
     dt_Plan_Add.LinkNamePlanType := DepartmentTreeList.FocusedNode.Parent.Parent.Values[2];
     dt_Plan_Add.NamePlanType     := DepartmentTreeList.FocusedNode.Parent.Parent.Values[2];
     dt_Plan_Add.Date_Beg_Limit   := StrToDate(DepartmentTreeList.FocusedNode.Parent.Values[3]);
     dt_Plan_Add.Date_End_Limit   := StrToDate(DepartmentTreeList.FocusedNode.Parent.Values[4]);

     dt_Plan_Add_Form1.PlanKindRadioGroup.ItemIndex := 1;
    end;
   end;
  end;
 end
 else begin
  if StagesTreeList.FocusedNode = nil then begin
   dt_Plan_Add_Form1.PlanKindRadioGroup.Enabled   := False;
   dt_Plan_Add.Link_Name_Depart    := '';
   dt_Plan_Add.Link_id_Depart      := -1;
   dt_Plan_Add_Form1.Date_Beg.Date := Now;

   dt_Plan_Add_Form1.PlanKindRadioGroup.ItemIndex := 0;
  end
  else begin
   case StagesTreeList.FocusedNode.Level of
   0 :
    begin
     dt_Plan_Add_Form1.PlanKindRadioGroup.Enabled   := False;
     dt_Plan_Add.Link_Name_Depart                   := '';
     dt_Plan_Add.Link_id_Depart                     := -1;
     dt_Plan_Add_Form1.Date_Beg.Date                := StrToDate(StagesTreeList.FocusedNode.Values[6]);

     dt_Plan_Add_Form1.PlanKindRadioGroup.ItemIndex := 0;
    end;
   1 :
    begin
     dt_Plan_Add_Form1.PlanKindRadioGroup.Enabled   := False;
     dt_Plan_Add.Link_Name_Depart                   := '';
     dt_Plan_Add.Link_id_Depart                     := -1;
     dt_Plan_Add_Form1.Date_Beg.Date                := Now;
     dt_Plan_Add.NamePlanType                       := StagesTreeList.FocusedNode.Values[2];
     dt_Plan_Add.id_Plan_Type                       := StagesTreeList.FocusedNode.Values[10];

     dt_Plan_Add_Form1.PlanKindRadioGroup.ItemIndex := 0;
    end;
   2 :
    begin
     dt_Plan_Add.Link_Name_Plan      := StagesTreeList.FocusedNode.Values[2];
     dt_Plan_Add.Link_Name_Depart    := StagesTreeList.FocusedNode.Values[5];
     dt_Plan_Add.Link_id_Depart      := StagesTreeList.FocusedNode.Values[1];
     dt_Plan_Add.Date_Beg_Limit      := StrToDate(StagesTreeList.FocusedNode.Values[3]);
     dt_Plan_Add.Date_End_Limit      := StrToDate(StagesTreeList.FocusedNode.Values[4]);
     dt_Plan_Add_Form1.Date_Beg.Date := StrToDate(StagesTreeList.FocusedNode.Parent.Parent.Values[6]);

     dt_Plan_Add_Form1.PlanKindRadioGroup.ItemIndex := 1;
    end;
   3 :
    begin
     dt_Plan_Add.Link_Name_Plan   := StagesTreeList.FocusedNode.Parent.Values[2];
     dt_Plan_Add.Link_Name_Depart := StagesTreeList.FocusedNode.Parent.Values[5];
     dt_Plan_Add.Link_id_Depart   := StagesTreeList.FocusedNode.Parent.Values[1];
     dt_Plan_Add.Date_Beg_Limit   := StrToDate(StagesTreeList.FocusedNode.Parent.Values[4]);
     dt_Plan_Add.Date_End_Limit   := StrToDate(StagesTreeList.FocusedNode.Parent.Values[4]);

     dt_Plan_Add_Form1.PlanKindRadioGroup.ItemIndex := 1;
    end;
   end;
  end;
 end;

 dt_Plan_Add_Form1.ShowModal;

 if dt_Plan_Add_Form1.ModalResult = mrOk then begin
  Name_Plan     := dt_Plan_Add_Form1.Name_Plan.Text;
  id_Plan_Type  := dt_Plan_Add.id_Plan_Type;
  id_Department := dt_Plan_Add.id_Department;
  Date_Beg      := dt_Plan_Add_Form1.Date_Beg.Date;
  Date_End      := dt_Plan_Add_Form1.Date_End.Date;


  if dt_Plan_Add_Form1.PlanKindRadioGroup.ItemIndex = 0 then Link_Plan_To := -1
  else begin
   if TabPage.ActivePageIndex = 0 then
   case DepartmentTreeList.FocusedNode.Level of
    0, 1 : Exit;
    2 : Link_Plan_To := DepartmentTreeList.FocusedNode.Values[1];
    3 : Link_Plan_To := DepartmentTreeList.FocusedNode.Parent.Values[1];
   end
   else
   case StagesTreeList.FocusedNode.Level of
    0, 1 : Exit;
    2 : Link_Plan_To := StagesTreeList.FocusedNode.Values[0];
    3 : Link_Plan_To := StagesTreeList.FocusedNode.Parent.Values[0];
   end;
  end;

  StoredProc.Transaction := dm.WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('SP_DT_PLANS_ADD', [id_Plan_Type, Link_Plan_To, Name_Plan,
  id_Department, Date_Beg, Date_End]);
  StoredProc.Transaction.Commit;


  RefreshDepartment(id_Department, id_Plan_Type, StoredProc.Fields[0].AsInteger, -1, True);
  RefreshStages(Date_Beg, Date_End, id_Plan_Type, StoredProc.Fields[0].AsInteger, -1, False);
 end;
end;

procedure Tdt_Plan_Form1.EditNameButtonClick(Sender: TObject);
var
 id_Plan_Type  : integer;
 id_Plan       : integer;
 Name_Plan     : string;
 id_Department : integer;
 Date_Beg      : TDate;
 Date_End      : TDate;
begin
 if TabPage.ActivePageIndex = 0 then begin
  if DepartmentTreeList.FocusedNode = nil then Exit;
  if DepartmentTreeList.FocusedNode.Level in [0, 1] then Exit;
  if (DepartmentTreeList.FocusedNode.Level = 1)
  and (DepartmentTreeList.FocusedNode.HasChildren) then begin
   ShowMessage('Неможна змінити річний план, тому що він має підпорядкованні плани!');
   Exit;
  end;

  if dt_Plan_Add_Form1 <> nil then exit;
  Application.CreateForm(Tdt_Plan_Add_Form1, dt_Plan_Add_Form1);
  dt_Plan_Add_Form1.Caption := 'Змінити назву плану';
  case DepartmentTreeList.FocusedNode.Level of
  0, 1 : Exit;
  2 :
   begin
    dt_Plan_Add_Form1.Name_Plan.Text      := DepartmentTreeList.FocusedNode.Values[2];
    dt_Plan_Add.Name_Depart               := DepartmentTreeList.FocusedNode.Parent.Parent.Values[2];
    dt_Plan_Add.id_Department             := DepartmentTreeList.FocusedNode.Parent.Parent.Values[0];
    dt_Plan_Add.Link_Name_Depart          := DepartmentTreeList.FocusedNode.Parent.Parent.Values[2];
    dt_Plan_Add.Link_id_Depart            := DepartmentTreeList.FocusedNode.Parent.Parent.Values[0];;
    dt_Plan_Add_Form1.Date_Beg.Date       := StrToDate(DepartmentTreeList.FocusedNode.Values[3]);
    dt_Plan_Add_Form1.Date_End.Date       := StrToDate(DepartmentTreeList.FocusedNode.Values[4]);
    dt_Plan_Add.NamePlanType              := DepartmentTreeList.FocusedNode.Parent.Values[2];
    dt_Plan_Add.id_Plan_Type              := DepartmentTreeList.FocusedNode.Parent.Values[7];

    if DepartmentTreeList.FocusedNode.HasChildren then begin
     dt_Plan_Add_Form1.Date_Beg.Enabled        := False;
     dt_Plan_Add_Form1.Date_End.Enabled        := False;
     dt_Plan_Add_Form1.Name_Department.Enabled := False;
    end;

    dt_Plan_Add_Form1.PlanKindRadioGroup.Enabled   := False;
    dt_Plan_Add_Form1.PlanKindRadioGroup.ItemIndex := 0;
   end;
  3 :
   begin
    dt_Plan_Add_Form1.Name_Plan.Text       := DepartmentTreeList.FocusedNode.Values[2];
    dt_Plan_Add.Link_Name_Depart           := DepartmentTreeList.FocusedNode.Parent.Parent.Parent.Values[2];
    dt_Plan_Add.Link_id_Depart             := DepartmentTreeList.FocusedNode.Parent.Parent.Parent.Values[0];
    dt_Plan_Add.Link_Name_Plan             := DepartmentTreeList.FocusedNode.Parent.Values[2];
    dt_Plan_Add._Date_Beg                  := StrToDate(DepartmentTreeList.FocusedNode.Values[3]);
    dt_Plan_Add._Date_End                  := StrToDate(DepartmentTreeList.FocusedNode.Values[4]);
    dt_Plan_Add.Date_Beg_Limit             := StrToDate(DepartmentTreeList.FocusedNode.Parent.Values[3]);
    dt_Plan_Add.Date_End_Limit             := StrToDate(DepartmentTreeList.FocusedNode.Parent.Values[4]);
    dt_Plan_Add.Edit                       := True;
    dt_Plan_Add.LinkNamePlanType           := DepartmentTreeList.FocusedNode.Parent.Parent.Values[2];
    dt_Plan_Add.id_Plan_Type               := DepartmentTreeList.FocusedNode.Parent.Parent.Values[7];

    dt_Plan_Add_Form1.PlanKindRadioGroup.Enabled   := False;
    dt_Plan_Add_Form1.PlanKindRadioGroup.ItemIndex := 1;
   end;
  end;

  dt_Plan_Add_Form1.ShowModal;

  if dt_Plan_Add_Form1.ModalResult = mrOk then begin
   id_Plan_Type           := dt_Plan_Add.id_Plan_Type;
   id_Plan                := DepartmentTreeList.FocusedNode.Values[1];
   Name_Plan              := dt_Plan_Add_Form1.Name_Plan.Text;
   id_Department          := dt_Plan_Add.id_Department;
   Date_Beg               := dt_Plan_Add_Form1.Date_Beg.Date;
   Date_End               := dt_Plan_Add_Form1.Date_End.Date;

   StoredProc.Transaction := dm.WriteTransaction;
   StoredProc.Transaction.StartTransaction;
   StoredProc.Close;
   StoredProc.ExecProcedure('SP_DT_PLANS_MODIFY', [id_Plan, id_Plan_Type,
   Name_Plan, id_Department, Date_Beg, Date_End]);
   StoredProc.Transaction.Commit;

   RefreshDepartment(id_Department, id_Plan_Type, id_Plan, -1, True);
  end;
 end
 else if TabPage.ActivePageIndex = 1 then begin
  if StagesTreeList.FocusedNode = nil then Exit;
  if StagesTreeList.FocusedNode.Level in [0, 1] then Exit;
  if dt_Plan_Add_Form1 <> nil then exit;
  Application.CreateForm(Tdt_Plan_Add_Form1, dt_Plan_Add_Form1);
  dt_Plan_Add_Form1.Caption := 'Змінити назву плану';
  case StagesTreeList.FocusedNode.Level of
  2 :
   begin
    dt_Plan_Add_Form1.Name_Plan.Text      := StagesTreeList.FocusedNode.Values[2];
    dt_Plan_Add.Name_Depart               := StagesTreeList.FocusedNode.Values[5];
    dt_Plan_Add.id_Department             := StagesTreeList.FocusedNode.Values[1];
    dt_Plan_Add_Form1.Date_Beg.Date       := StrToDate(StagesTreeList.FocusedNode.Values[3]);
    dt_Plan_Add_Form1.Date_End.Date       := StrToDate(StagesTreeList.FocusedNode.Values[4]);
    dt_Plan_Add.NamePlanType              := StagesTreeList.FocusedNode.Parent.Values[2];
    dt_Plan_Add.id_Plan_Type              := StagesTreeList.FocusedNode.Parent.Values[10];

    if StagesTreeList.FocusedNode.HasChildren then begin
     dt_Plan_Add_Form1.Date_Beg.Enabled        := False;
     dt_Plan_Add_Form1.Date_End.Enabled        := False;
     dt_Plan_Add_Form1.Name_Department.Enabled := False;
    end;

    dt_Plan_Add_Form1.PlanKindRadioGroup.Enabled   := False;
    dt_Plan_Add_Form1.PlanKindRadioGroup.ItemIndex := 0;
   end;
  3 :
   begin
    dt_Plan_Add_Form1.Name_Plan.Text       := StagesTreeList.FocusedNode.Values[2];
    dt_Plan_Add.Link_Name_Depart           := StagesTreeList.FocusedNode.Parent.Values[5];
    dt_Plan_Add.Link_id_Depart             := StagesTreeList.FocusedNode.Parent.Values[1];
    dt_Plan_Add.Link_Name_Plan             := StagesTreeList.FocusedNode.Parent.Values[2];
    dt_Plan_Add._Date_Beg                  := StrToDate(StagesTreeList.FocusedNode.Values[3]);
    dt_Plan_Add._Date_End                  := StrToDate(StagesTreeList.FocusedNode.Values[4]);
    dt_Plan_Add.Date_Beg_Limit             := StrToDate(StagesTreeList.FocusedNode.Parent.Values[3]);
    dt_Plan_Add.Date_End_Limit             := StrToDate(StagesTreeList.FocusedNode.Parent.Values[4]);
    dt_Plan_Add.Edit                       := True;
    dt_Plan_Add.LinkNamePlanType           := StagesTreeList.FocusedNode.Parent.Parent.Values[2];
    dt_Plan_Add.id_Plan_Type               := StagesTreeList.FocusedNode.Parent.Parent.Values[10];

    dt_Plan_Add_Form1.PlanKindRadioGroup.Enabled   := False;
    dt_Plan_Add_Form1.PlanKindRadioGroup.ItemIndex := 1;
   end;
  end;

  dt_Plan_Add_Form1.ShowModal;

  if dt_Plan_Add_Form1.ModalResult = mrOk then begin
   id_Plan_Type           := dt_Plan_Add.id_Plan_Type;
   id_Plan                := StagesTreeList.FocusedNode.Values[2];
   Name_Plan              := dt_Plan_Add_Form1.Name_Plan.Text;
   id_Department          := dt_Plan_Add.id_Department;
   Date_Beg               := dt_Plan_Add_Form1.Date_Beg.Date;
   Date_End               := dt_Plan_Add_Form1.Date_End.Date;

   StoredProc.Transaction := dm.WriteTransaction;
   StoredProc.Transaction.StartTransaction;
   StoredProc.Close;
   StoredProc.ExecProcedure('SP_DT_PLANS_MODIFY', [id_Plan, id_Plan_Type,
   Name_Plan, id_Department, Date_Beg, Date_End]);
   StoredProc.Transaction.Commit;

   RefreshStages(Date_Beg, Date_End, id_Plan_Type, id_Plan, -1, True);
  end;
 end;
end;

procedure Tdt_Plan_Form1.CloseButtonClick(Sender: TObject);
begin
 Close;
end;

procedure Tdt_Plan_Form1.RefreshButtonClick(Sender: TObject);
begin
 Name_Column1.SortOrder            := soNone;
 Date_Beg_Column1.SortOrder        := soNone;
 Date_End_Column1.SortOrder        := soNone;
 Name_Column2.SortOrder            := soNone;
 Date_Beg_Column2.SortOrder        := soNone;
 Date_End_Column2.SortOrder        := soNone;
 Name_Department_Column2.SortOrder := soNone;

 if TabPage.ActivePageIndex = 0 then
  if (DepartmentTreeList.Count = 0) or (DepartmentTreeList.FocusedNode = nil) then begin
   RefreshDepartment(-1, -1, -1, -1, True);
   RefreshStages(0, 0, -1, -1, -1, False);
  end
  else begin
   case DepartmentTreeList.FocusedNode.Level of
    0 : RefreshDepartment(DepartmentTreeList.FocusedNode.Values[0], -1, -1, -1, True);
    1 : RefreshDepartment(DepartmentTreeList.FocusedNode.Parent.Values[0],
        DepartmentTreeList.FocusedNode.Values[7], -1, -1, True);
    2 : RefreshDepartment(DepartmentTreeList.FocusedNode.Parent.Parent.Values[0],
        DepartmentTreeList.FocusedNode.Values[7], DepartmentTreeList.FocusedNode.Values[1], -1, True);
    3 : RefreshDepartment(DepartmentTreeList.FocusedNode.Parent.Parent.Parent.Values[0],
        DepartmentTreeList.FocusedNode.Values[7], DepartmentTreeList.FocusedNode.Values[1], -1, True);
   end
  end
 else
  if (StagesTreeList.Count = 0) or (StagesTreeList.FocusedNode = nil) then begin
   RefreshDepartment(-1, -1, -1, -1, True);
   RefreshStages(0, 0, -1, -1, -1, False);
  end
  else begin
   case StagesTreeList.FocusedNode.Level of
    0 : RefreshStages(StrToDate(StagesTreeList.FocusedNode.Values[6]),
        StrToDate(StagesTreeList.FocusedNode.Values[7]), -1, -1, -1, True);
    1 : RefreshStages(StrToDate(StagesTreeList.FocusedNode.Parent.Values[6]),
        StrToDate(StagesTreeList.FocusedNode.Parent.Values[7]), StagesTreeList.FocusedNode.Values[10], -1, -1, True);
    2 : RefreshStages(StrToDate(StagesTreeList.FocusedNode.Parent.Parent.Values[6]),
        StrToDate(StagesTreeList.FocusedNode.Parent.Parent.Values[7]),
        StagesTreeList.FocusedNode.Values[10], StagesTreeList.FocusedNode.Values[0], -1, True);
    3 : RefreshStages(StrToDate(StagesTreeList.FocusedNode.Parent.Parent.Parent.Values[6]),
        StrToDate(StagesTreeList.FocusedNode.Parent.Parent.Parent.Values[7]),
        StagesTreeList.FocusedNode.Values[10], StagesTreeList.FocusedNode.Values[0], -1, True);
   end;
  end;
end;

procedure Tdt_Plan_Form1.DelButtonClick(Sender: TObject);
var
 id_Plan : integer;
begin
 if TabPage.ActivePageIndex = 0 then begin
  if DepartmentTreeList.FocusedNode = nil then Exit;
  if DepartmentTreeList.FocusedNode.Level = 0 then Exit;

  if DepartmentTreeList.FocusedNode.HasChildren then begin
   ShowMessage('Неможна знищити план. Знищить спочатку усі підпорядковані плани!');
   Exit;
  end;

  if MessageDlg('Знищення запису', 'Ви дійсно бажаєте знищити цей план?',
  mtConfirmation, [mbYes, mbNo]) <> mrYes then Exit;

  id_Plan := DepartmentTreeList.FocusedNode.Values[1];
  StoredProc.Transaction := dm.WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('SP_DT_PLANS_DEL', [id_Plan]);
  StoredProc.Transaction.Commit;

  RefreshDepartment(-1, -1, -1, DepartmentTreeList.FocusedNode.AbsoluteIndex, True);
 end;

 if TabPage.ActivePageIndex = 1 then begin
  if StagesTreeList.FocusedNode = nil then Exit;
  if StagesTreeList.FocusedNode.Level = 0 then Exit;

  if StagesTreeList.FocusedNode.HasChildren then begin
   ShowMessage('Неможна знищити план. Знищить спочатку усі підпорядковані плани!');
   Exit;
  end;

  if MessageDlg('Знищення запису', 'Ви дійсно бажаєте знищити цей план?',
  mtConfirmation, [mbYes, mbNo]) <> mrYes then Exit;

  id_Plan := StagesTreeList.FocusedNode.Values[0];
  StoredProc.Transaction := dm.WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('SP_DT_PLANS_DEL', [id_Plan]);
  StoredProc.Transaction.Commit;

  RefreshStages(0, 0, -1, -1, StagesTreeList.FocusedNode.AbsoluteIndex, True);
 end;
end;

procedure Tdt_Plan_Form1.EditButtonClick(Sender: TObject);
begin
// if PlanEditorForm <> nil then Exit;

 if TabPage.ActivePageIndex = 0 then begin
  if DepartmentTreeList.FocusedNode = nil then Exit;
  if DepartmentTreeList.FocusedNode.Level in [0, 1] then Exit;

  Application.CreateForm(TPlanEditorForm, PlanEditorForm);

  case DepartmentTreeList.FocusedNode.Level of
  2 :
   begin
    PlanEditorForm.YearPlan      := True;
    PlanEditorForm.DepName       := DepartmentTreeList.FocusedNode.Parent.Parent.Values[2];
    PlanEditorForm.NeedRefresh   := DepartmentTreeList.FocusedNode.Values[5];
    PlanEditorForm.id_Department := DepartmentTreeList.FocusedNode.Parent.Parent.Values[0];
   end;
  3 :
   begin
    PlanEditorForm.YearPlan      := False;
    PlanEditorForm.NeedRefresh   := False;
    PlanEditorForm.DepName       := DepartmentTreeList.FocusedNode.Parent.Parent.Parent.Values[2];
    PlanEditorForm.id_Year_Plan  := DepartmentTreeList.FocusedNode.Parent.Values[1];
    PlanEditorForm.id_Department := DepartmentTreeList.FocusedNode.Parent.Parent.Parent.Values[0];
   end;
  end;

  PlanEditorForm.id_Plan       := DepartmentTreeList.FocusedNode.Values[1];
  PlanEditorForm.Plan_Date_Beg := StrToDate(DepartmentTreeList.FocusedNode.Values[3]);
  PlanEditorForm.Plan_Date_End := StrToDate(DepartmentTreeList.FocusedNode.Values[4]);
  PlanEditorForm.Plan_Name     := DepartmentTreeList.FocusedNode.Values[2];
  PlanEditorForm.MainPlan      := DepartmentTreeList.FocusedNode.Values[6];
 end
 else if TabPage.ActivePageIndex = 1 then Begin
  if StagesTreeList.FocusedNode = nil then Exit;
  if StagesTreeList.FocusedNode.Level in [0, 1] then Exit;

  Application.CreateForm(TPlanEditorForm, PlanEditorForm);

  PlanEditorForm.id_Plan       := StagesTreeList.FocusedNode.Values[0];
  PlanEditorForm.Plan_Date_Beg := StrToDate(StagesTreeList.FocusedNode.Values[3]);
  PlanEditorForm.Plan_Date_End := StrToDate(StagesTreeList.FocusedNode.Values[4]);
  PlanEditorForm.Plan_Name     := StagesTreeList.FocusedNode.Values[2];

  case StagesTreeList.FocusedNode.Level of
  2 :
   begin
    PlanEditorForm.YearPlan      := True;
    PlanEditorForm.NeedRefresh   := StagesTreeList.FocusedNode.Values[8];
   end;
  3 :
   begin
    PlanEditorForm.YearPlan      := False;
    PlanEditorForm.NeedRefresh   := False;
    PlanEditorForm.id_Year_Plan  := StagesTreeList.FocusedNode.Parent.Values[0];
   end;
  end;

  PlanEditorForm.DepName       := StagesTreeList.FocusedNode.Values[5];
  PlanEditorForm.MainPlan      := StagesTreeList.FocusedNode.Values[9];
  PlanEditorForm.id_Department := StagesTreeList.FocusedNode.Values[1];
 end;

 PlanEditorForm.SelectAll;

// PlanEditorForm.Show;

// Enabled := False;
end;

procedure Tdt_Plan_Form1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure Tdt_Plan_Form1.DBGrid1DblClick(Sender: TObject);
begin
 EditButtonClick(Sender);
end;

procedure Tdt_Plan_Form1.ActionModExecute(Sender: TObject);
begin
 EditButtonClick(Sender);
end;

procedure Tdt_Plan_Form1.ActionDelExecute(Sender: TObject);
begin
 DelButtonClick(Sender);
end;

procedure Tdt_Plan_Form1.ActionAddExecute(Sender: TObject);
begin
 AddButtonClick(Sender);
end;

procedure Tdt_Plan_Form1.ActionSelExecute(Sender: TObject);
begin
 DBGrid1DblClick(Sender);
end;

procedure Tdt_Plan_Form1.ActionRefreshExecute(Sender: TObject);
begin
 RefreshButtonClick(Sender);
end;

procedure Tdt_Plan_Form1.FormShow(Sender: TObject);
begin
 FilterYearBeg.Value := GetYear(Now);
 FilterYearEnd.Value := GetYear(Now);

 TabPage.ActivePageIndex := 0;
 DepartmentTreeList.SetFocus;
 RefreshDepartment(-1, -1, -1, -1, True);
 RefreshStages(0, 0, -1, -1, -1, False);

 if DepartmentTreeList.Count = 1 then begin
  DepartmentTreeList.Items[0].Expand(False);
  if DepartmentTreeList.Nodes[0].Count > 0 then DepartmentTreeList.Nodes[0].Items[0].Expand(False);
 end;
end;

procedure Tdt_Plan_Form1.DepartmentTreeListDblClick(Sender: TObject);
begin
 EditButtonClick(Sender);
end;

procedure Tdt_Plan_Form1.StagesTreeListDblClick(Sender: TObject);
begin
 EditButtonClick(Sender);
end;

procedure Tdt_Plan_Form1.TabPageChange(Sender: TObject);
var
 i, j, k, t : integer;
 Flag       : boolean;
begin
 if TabPage.ActivePageIndex = 0 then begin
  if DepartmentTreeList.Count = 0 then Exit;
  if StagesTreeList.FocusedNode = nil then Exit;
  if StagesTreeList.FocusedNode.Level in [0, 1] then Exit;

  Flag := False;
  for i := 0 to DepartmentTreeList.Count - 1 do
   if DepartmentTreeList.Items[i].Values[0] = StagesTreeList.FocusedNode.Values[1]
   then begin
    Flag := True;
    Break;
   end;

  if not Flag then Exit;

  Flag := False;
  for t := 0 to DepartmentTreeList.Items[i].Count - 1 do
   if DepartmentTreeList.Items[i].Items[t].Values[7] = StagesTreeList.FocusedNode.Values[10]
   then begin
    Flag := True;
    Break;
   end;

  if (not Flag) or (DepartmentTreeList.Items[i].Items[t].Count = 0) then begin
   DepartmentTreeList.Items[i].Focused := True;
   Exit;
  end;

  case StagesTreeList.FocusedNode.Level of
  2 :
   begin
    for j := 0 to DepartmentTreeList.Items[i].Items[t].Count - 1 do
     if DepartmentTreeList.Items[i].Items[t].Items[j].Values[1] = StagesTreeList.FocusedNode.Values[0]
     then begin
      DepartmentTreeList.Items[i].Items[t].Items[j].Focused := True;
      Break;
     end;
   end;
  3 :
   begin
    for j := 0 to DepartmentTreeList.Items[i].Items[t].Count - 1 do
     if DepartmentTreeList.Items[i].Items[t].Items[j].Values[1] = StagesTreeList.FocusedNode.Parent.Values[0]
     then begin
      if DepartmentTreeList.Items[i].Items[t].Items[j].Count = 0 then Break;
      for k := 0 to DepartmentTreeList.Items[i].Items[t].Items[j].Count - 1 do begin
       if DepartmentTreeList.Items[i].Items[t].Items[j].Items[k].Values[1] = StagesTreeList.FocusedNode.Values[0]
       then begin
        DepartmentTreeList.Items[i].Items[t].Items[j].Items[k].Focused := True;
        Break;
       end;
      end;
      Break;
     end;
   end;
  end;
 end
 else if TabPage.ActivePageIndex = 1 then begin
  if StagesTreeList.Count = 0 then Exit;
  if DepartmentTreeList.FocusedNode = nil then Exit;
  if DepartmentTreeList.FocusedNode.Level in [0, 1] then Exit;

  Flag := False;
  for i := 0 to StagesTreeList.Count - 1 do
   case DepartmentTreeList.FocusedNode.Level of
   2 :
    begin
     if (StagesTreeList.Items[i].Values[6] = DepartmentTreeList.FocusedNode.Values[3])
     and (StagesTreeList.Items[i].Values[7] = DepartmentTreeList.FocusedNode.Values[4])
     then begin
      Flag := True;
      Break;
     end;
    end;
   3 :
    begin
     if (StagesTreeList.Items[i].Values[6] = DepartmentTreeList.FocusedNode.Parent.Values[3])
     and (StagesTreeList.Items[i].Values[7] = DepartmentTreeList.FocusedNode.Parent.Values[4])
     then begin
      Flag := True;
      Break;
     end;
    end;
   end;

  if not Flag then Exit;
  if StagesTreeList.Items[i].Count = 0 then Exit;

  Flag := False;
  for t := 0 to StagesTreeList.Items[i].Count - 1 do
   if StagesTreeList.Items[i].Items[t].Values[10] = DepartmentTreeList.FocusedNode.Values[7]
   then begin
    Flag := True;
    Break;
   end;

  if not Flag or (StagesTreeList.Items[i].Items[t].Count = 0) then begin
   StagesTreeList.Items[i].Focused := True;
   Exit;
  end;

  case DepartmentTreeList.FocusedNode.Level of
  2 :
   begin
    for j := 0 to StagesTreeList.Items[i].Count - 1 do
     if StagesTreeList.Items[i].Items[t].Items[j].Values[0] = DepartmentTreeList.FocusedNode.Values[1]
     then begin
      StagesTreeList.Items[i].Items[t].Items[j].Focused := True;
      Break;
     end;
   end;
  3 :
   begin
    for j := 0 to StagesTreeList.Items[i].Items[t].Count - 1 do
     if StagesTreeList.Items[i].Items[t].Items[j].Values[0] = DepartmentTreeList.FocusedNode.Parent.Values[1]
     then begin
      if StagesTreeList.Items[i].Items[t].Items[j].Count = 0 then Break;
      for k := 0 to StagesTreeList.Items[i].Items[t].Items[j].Count - 1 do begin
       if StagesTreeList.Items[i].Items[t].Items[j].Items[k].Values[0] = DepartmentTreeList.FocusedNode.Values[1] then begin
        StagesTreeList.Items[i].Items[t].Items[j].Items[k].Focused := True;
        Break
       end;
      end;
      Break;
     end;
   end;
  end;
 end;
end;

procedure Tdt_Plan_Form1.ActionExitExecute(Sender: TObject);
begin
 CloseButtonClick(Sender);
end;

procedure Tdt_Plan_Form1.SetFilterClick(Sender: TObject);
begin
 RefreshButtonClick(Sender);
end;

procedure Tdt_Plan_Form1.FilterYearBegPropertiesEditValueChanged(
  Sender: TObject);
begin
 if SetFilter.Checked then SetFilterClick(Sender);
end;

procedure Tdt_Plan_Form1.DepartmentTreeListCustomDrawCell(Sender: TObject;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
begin
 if AViewInfo.Node.Level = 2 then
  if AViewInfo.Node.Values[5] then ACanvas.Brush.Color := $7799ff;
end;

procedure Tdt_Plan_Form1.StagesTreeListCustomDrawCell(Sender: TObject;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
begin
 if AViewInfo.Node.Level = 2 then
  if AViewInfo.Node.Values[8] then ACanvas.Brush.Color := $7799ff;
end;

end.
