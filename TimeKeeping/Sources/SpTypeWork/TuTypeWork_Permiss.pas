unit TuTypeWork_Permiss;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, dxBar, dxBarExtItems, cxGraphics, cxControls, dxStatusBar,
  ExtCtrls, cxStyles,TableCentral,Spin, Mask,StdCtrls,DateUtils,TuCommonProc;

type
  TFormPermis = class(TForm)
    BarManager: TdxBarManager;
    ButtonRefresh: TdxBarLargeButton;
    ButtonExit: TdxBarLargeButton;
    Grid: TStringGrid;
    ButtonUpdate: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxStatusBar1: TdxStatusBar;
    CustomdxBarCombo1: TCustomdxBarCombo;
    dxBarCombo1: TdxBarCombo;
    dxBarButton1: TdxBarButton;
    Image1: TImage;
    dxBarSpinEdit1: TdxBarSpinEdit;
    dxStatusBar2: TdxStatusBar;
    dxStatusBar3: TdxStatusBar;
    procedure ButtonRefreshClick(Sender: TObject);
    procedure GridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure GridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormShow(Sender: TObject);
    procedure ButtonUpdateClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure ButtonExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    x_num, x_name, x_id,x_name_full:variant;
    SelectedRow, SelectedCol,n:integer;
   constructor create (Aowner: TComponent);reintroduce;
    procedure IsGrid;

  end;



implementation

uses TuTypeWork_DM, FIBDataSet, FIBQuery;

{$R *.dfm}

{ TFormPermis }

constructor TFormPermis.create(Aowner: TComponent);
var i:integer;
begin

 inherited create (Aowner);
 ButtonRefreshClick(nil);
 //*****************************************************************************
 dxStatusBar3.Panels[0].Text:= 'F2-'+GetConst('Update','Button');
 dxStatusBar3.Panels[1].Text:= 'F5-'+GetConst('Refresh','Button');
 dxStatusBar3.Panels[2].Text:= 'Esc-'+GetConst('Exit','Button');
 for i:=0 to dxStatusBar3.Panels.Count-1 do
   dxStatusBar3.Panels[i].Width := dxStatusBar3.Width div dxStatusBar3.Panels.Count;
 //*****************************************************************************

end;

procedure TFormPermis.ButtonRefreshClick(Sender: TObject);
var i,k:integer;
begin

  dm.DSetPermis.close;
  dm.DSetPermis.SelectSQL.text:='select * from sp_vihod sv where sv.name_num is not null order by name_num ';
  dm.DSetPermis.open;
     n:=dm.DSetPermis.RecordCountFromSrv;
  if VarIsEmpty(x_num)then   x_num:=VarArrayCreate([0,n], varInteger);
  if VarIsEmpty(x_name)then   x_name:=VarArrayCreate([0,n], varVariant);
  if VarIsEmpty(x_id)then   x_id:=VarArrayCreate([0,n], varinteger);
   if VarIsEmpty(x_name_full)then   x_name_full:=VarArrayCreate([0,n], varVariant);
  Grid.ColCount:=n+1;
  Grid.RowCount:=n+1;
  dm.DSetPermis.First;

  for i:=1 to n do
  begin
    x_num[i]:=dm.DSetPermis['NAME_NUM'];
    x_name[i]:=dm.DSetPermis['NAME_SHORT'];
    x_id[i]:=dm.DSetPermis['ID_VIHOD'];
    x_name_full[i]:=dm.DSetPermis['NAME_FULL'];
    dm.DSetPermis.Next;
  end ;
  dm.DSetPermis.close;
  dm.DSetPermis.SelectSQL.text:='select * from tu_tsh_ban_value';
  dm.DSetPermis.open;
  grid.Refresh;

end;

procedure TFormPermis.IsGrid;
begin

end;

procedure TFormPermis.GridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
  var T :TBrush;
  lx,ly:integer;
begin

if dm.DSetPermis.active then
with Grid.Canvas do
begin

  if not( ACol=0) or (ARow=0) then
  begin

   if (ACol = SelectedCol) or (ARow = SelectedRow) then  Brush.Color := RGB(220, 250, 255)
   else
     if ARow mod 2 = 0 then Brush.Color := clInfoBk
     else Brush.Color := clWhite;

  end
 else
 begin

   if (ARow = SelectedRow ) then Brush.Color := RGB(220, 250, 255)
   else
     if ARow mod 2 = 0 then Brush.Color := clMoneyGreen
     else Brush.Color := clSkyBlue;

 end;

   FillRect(Rect);
 if (not( ( ACol=0) or (ARow=0)) ) then
 begin
 if Dm.DSetPermis.Locate('id_vihod;id_vihod_last',VarArrayof([x_id[Arow],x_id[Acol]]), []) then
  begin
          dxBarSpinEdit1.Value:=dxBarSpinEdit1.Value+1;
          pen.Color :=clRed;
          pen.Width:=3;
          lx:=Rect.TopLeft.x +round( (Rect.BottomRight.x-Rect.TopLeft.x)/2);
          ly:=Rect.TopLeft.y +round( (Rect.BottomRight.y-Rect.TopLeft.y)/2);
          MoveTo(lx-4,ly-4);
          LineTo(lx+4,ly+4);
          MoveTo(lx+4,ly-4);
          LineTo(lx-4,ly+4);
      end
  else
    begin
        {  pen.Color :=clGreen;
          pen.Width:=2;
          lx:=Rect.TopLeft.x +round( (Rect.BottomRight.x-Rect.TopLeft.x)/2);
          ly:=Rect.TopLeft.y +round( (Rect.BottomRight.y-Rect.TopLeft.y)/2);
          MoveTo(lx-3,ly+1);
          LineTo(lx,ly+4);
          MoveTo(lx,ly+4);
          LineTo(lx+4,ly);   }
    
    end ;

  end;
  Grid.Canvas.Font.Size:=8;
   Grid.Canvas.Font.Color:=clBlack ;
    if( Arow=0)  then TextOut(Rect.TopLeft.X,Rect.TopLeft.Y,x_num[ACol] );
  if( ACol=0)  then TextOut(Rect.TopLeft.X,Rect.TopLeft.Y,x_num[Arow] );
  Grid.Canvas.Font.Size:=5;


     Grid.Canvas.Font.Color:=clred;
    if( Arow=0)  then TextOut(Rect.TopLeft.X+5,Rect.TopLeft.Y+15,x_name[ACol] );
  if( ACol=0)  then TextOut(Rect.TopLeft.X+17,Rect.TopLeft.Y+3,x_name[Arow] );



 end;


end;

procedure TFormPermis.GridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
if (ACol=0) or (ARow=0)  then CanSelect:=false;
SelectedCol:=ACol;
SelectedRow:=ARow;
dxStatusBar1.Panels[0].Text:='Горизонталь:';
dxStatusBar2.Panels[0].Text:='Вертикаль:';
dxStatusBar1.Panels[1].Text:=x_name_full[ARow];
dxStatusBar2.Panels[1].Text:=x_name_full[ACol];
grid.Refresh;
end;

procedure TFormPermis.FormShow(Sender: TObject);
begin
Height:=BarManager.Bars[0].FloatClientHeight+Grid.DefaultRowHeight*n+3*dxStatusBar1.Height;
Width:= Grid.DefaultColWidth*n+90;
end;

procedure TFormPermis.ButtonUpdateClick(Sender: TObject);
begin
with dm.StProc do
begin
  Transaction.StartTransaction;
  StoredProcName:='TU_TSH_BAN_VALUE_I_OR_D';
  Prepare;

  ParamByName('ID_VIHOD').ASInteger   :=x_id[Selectedrow];
  ParamByName('ID_VIHOD_LAST').ASInteger   :=x_id[Selectedcol];
  ExecProc;
  Transaction.Commit;
  ButtonRefreshClick(sender);
end;
 end;
procedure TFormPermis.GridDblClick(Sender: TObject);
begin
ButtonUpdateClick(sender);
end;

procedure TFormPermis.ButtonExitClick(Sender: TObject);
begin
modalresult:=mrCancel;
end;

end.
