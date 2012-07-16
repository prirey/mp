;10 probs, 2 goals, 2 objs

(setq *TEST-PROBS*
    '((CC2-1 (and (shape A CYLINDRICAL) (has-hole B (1 cm) ORIENTATION-2))
            ((last-time 3)
             (is-bolt (B1 (6 mm)))
             (last-scheduled B 0)
             (last-scheduled A 0)
             (surface-condition B POLISHED)
             (temperature B COLD)
             (shape B UNDETERMINED)
             (is-object B)
             (temperature A COLD)
             (shape A UNDETERMINED)
             (is-object A)))
     (CC2-2 (and (painted B (WATER-RES RED))(shape B CYLINDRICAL))
            ((last-time 3)
             (is-bolt (B1 (8 mm)))
             (last-scheduled B 0)
             (last-scheduled A 0)
             (temperature B COLD)
             (shape B UNDETERMINED)
             (is-object B)
             (has-hole A (2 mm) ORIENTATION-3)
             (surface-condition A ROUGH)
             (temperature A COLD)
             (shape A RECTANGULAR)
             (is-object A)))
     (CC2-3 (and (joined A B ORIENTATION-2) (painted B (REGULAR RED)))
            ((last-time 3)
             (is-bolt (B1 (6 mm)))
             (last-scheduled B 0)
             (last-scheduled A 0)
             (has-hole B (6 mm) ORIENTATION-2)
             (has-hole A (6 mm) ORIENTATION-2)
             (surface-condition B POLISHED)
             (temperature B COLD)
             (shape B UNDETERMINED)
             (is-object B)
             (temperature A COLD)
             (shape A UNDETERMINED)
             (is-object A)))
     (CC2-4 (and (joined A B ORIENTATION-4)
                 (surface-condition A SMOOTH))
            ((last-time 3)
             (is-bolt (B1 (2 mm)))
             (last-scheduled B 0)
             (last-scheduled A 0)
             (temperature B COLD)
             (has-hole B (2 mm) ORIENTATION-4)
             (has-hole A (2 mm) ORIENTATION-4)
             (shape B IRREGULAR)
             (is-object B)
             (has-hole A (6 mm) ORIENTATION-2)
             (painted A (REGULAR RED))
             (temperature A COLD)
             (shape A UNDETERMINED)
             (is-object A)))
     (CC2-5 (and (joined A B ORIENTATION-2) (painted A (WATER-RES RED)))
            ((last-time 3)
             (is-bolt (B1 (1.4 cm)))
             (last-scheduled B 0)
             (last-scheduled A 0)
             (has-hole B (1.4 cm) ORIENTATION-2)
             (has-hole A (1.4 cm) ORIENTATION-2)
             (surface-condition B SMOOTH)
             (temperature B COLD)
             (shape B UNDETERMINED)
             (is-object B)
             (temperature A COLD)
             (shape A IRREGULAR)
             (is-object A)))
     (CC2-6 (and (surface-condition B POLISHED)
		 (has-hole B (6 mm) ORIENTATION-4))
            ((last-time 3)
             (is-bolt (B1 (2 mm)))
             (last-scheduled B 0)
             (last-scheduled A 0)
             (has-hole B (2 mm) ORIENTATION-2)
             (painted B (REGULAR RED))
             (temperature B COLD)
             (shape B UNDETERMINED)
             (is-object B)
             (surface-condition A ROUGH)
             (temperature A COLD)
             (shape A IRREGULAR)
             (is-object A)))
     (CC2-7 (and (painted A (REGULAR RED)) (surface-condition A SMOOTH))
           ((last-time 3)
            (is-bolt (B1 (8 mm)))
            (last-scheduled B 0)
            (last-scheduled A 0)
            (painted B (REGULAR WHITE))
            (temperature B COLD)
            (shape B RECTANGULAR)
            (is-object B)
            (temperature A COLD)
            (shape A UNDETERMINED)
            (is-object A)))
     (CC2-8 (and (painted B (WATER-RES RED))
		 (shape B CYLINDRICAL))
           ((last-time 3)
            (is-bolt (B1 (8 mm)))
            (last-scheduled B 0)
            (last-scheduled A 0)
            (has-hole B (4 mm) ORIENTATION-3)
            (temperature B COLD)
            (shape B UNDETERMINED)
            (is-object B)
            (surface-condition A POLISHED)
            (temperature A COLD)
            (shape A RECTANGULAR)
            (is-object A)))
     (CC2-9 (and (painted B (REGULAR RED)) (shape B CYLINDRICAL))
           ((last-time 3)
            (is-bolt (B1 (1.4 cm)))
            (last-scheduled B 0)
            (last-scheduled A 0)
            (surface-condition B ROUGH)
            (temperature B COLD)
            (shape B RECTANGULAR)
            (is-object B)
            (temperature A COLD)
            (shape A RECTANGULAR)
            (is-object A)))
     (CC2-10 (and (painted B (WATER-RES RED))
                (surface-condition B SMOOTH))
           ((last-time 3)
            (is-bolt (B1 (2 mm)))
            (last-scheduled B 0)
            (last-scheduled A 0)
            (temperature B COLD)
            (shape B UNDETERMINED)
            (is-object B)
            (temperature A COLD)
            (shape A UNDETERMINED)
            (is-object A)))))
