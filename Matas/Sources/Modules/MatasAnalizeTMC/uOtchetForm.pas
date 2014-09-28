unit uOtchetForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uRepAnalizeTMC, DB, Grids, DBGrids;

type
  TOtchetForma = class(TForm)
    DBGrid1: TDBGrid;
    DataSource: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OtchetForma: TOtchetForma;

implementation

{$R *.dfm}

end.
