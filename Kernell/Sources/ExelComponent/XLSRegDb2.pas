unit XLSRegDb2;

{
********************************************************************************
******* XLSReadWriteII V2.00                                             *******
*******                                                                  *******
******* Copyright(C) 1999,2004 Lars Arvidsson, Axolot Data               *******
*******                                                                  *******
******* email: components@axolot.com                                     *******
******* URL:   http://www.axolot.com                                     *******
********************************************************************************
** Users of the XLSReadWriteII component must accept the following            **
** disclaimer of warranty:                                                    **
**                                                                            **
** XLSReadWriteII is supplied as is. The author disclaims all warranties,     **
** expressedor implied, including, without limitation, the warranties of      **
** merchantability and of fitness for any purpose. The author assumes no      **
** liability for damages, direct or consequential, which may result from the  **
** use of XLSReadWriteII.                                                     **
********************************************************************************
}

{$B-}
{$R-}

{$I XLSRWII2.inc}

interface
                          
uses Classes, XLSReadWriteII2, BIFFRecsII2,  XLSDbRead2,
{$ifdef OLD_COMPILER}
DsgnIntf;
{$else}
DesignIntf;
{$endif}

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('XLS', [TXLSDbRead2]);
end;

end.
